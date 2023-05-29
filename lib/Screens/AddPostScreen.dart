import 'dart:io';

import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/snackbar.dart';
import 'package:elison/controllers/customer/posts/add_edit_post_controller.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../controllers/customer/posts/post_controller.dart';

class AddPostScreen extends StatefulWidget {
  static const routeName = "AddPostScreen";

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? media;
  bool? isVideo = false;
  final postController = Get.put(
      AddEditPostController(index: Get.arguments[1], isEdit: Get.arguments[0]));
  final _formKey = GlobalKey<FormState>();
  // VideoPlayerController? _videoPlayerController;
  // Future<void>? _initializeVideoPlayerFuture;
  getGalaryImage() async {
    dynamic imageData = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    setState(() {
      media = File(imageData.path);
    });
  }

  getCamImage() async {
    dynamic imageData =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      media = File(imageData.path);
    });
  }

  // Future<void> pickVideo() async {
  //   final pickedVideo =
  //       await ImagePicker().pickVideo(source: ImageSource.gallery);
  //   if (pickedVideo != null) {
  //     setState(() {
  //       media = File(pickedVideo.path);
  //     });
  //   }
  // }
  Future<void> pickVideo() async {
    final pickedVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      final videoFile = File(pickedVideo.path);
      postController.videoPlayerController.value =
          VideoPlayerController.file(videoFile);
      postController.initializeVideoPlayerFuture.value =
          postController.videoPlayerController.value!.initialize();
      setState(() {
        media = videoFile;
        // _pickedImage = null;
      });
    }
  }

  // @override
  // void dispose() {
  //   postController.videoPlayerController.value!.dispose();
  //   super.dispose();
  // }

  void openOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile photo',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await pickVideo();
                          if (media != null) {
                            // editprofileController.uploadProfileImage(
                            //     image!.path, context);
                            isVideo = true;
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.videocam),
                      ),
                      const Text('Video')
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await getGalaryImage();
                          if (media != null) {
                            print('gallery media');
                            if (media != null) {
                              // editprofileController.uploadProfileImage(
                              //     image!.path, context);
                              isVideo = false;
                              Navigator.pop(context);
                            }
                          }
                        },
                        icon: const Icon(Icons.photo),
                      ),
                      const Text('Image')
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black,
              size: 20,
            ),
          ),
          title: Text(
            "Post",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            postController.isLoading.value
                ? Text(
                    'Loading...',
                    style: TextStyle(color: Colors.red),
                  )
                : IconButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        if (media != null || postController.isEdit!) {
                          postController.addpost(
                              media ?? null, context, !isVideo!);
                        } else {
                          snackbar(
                              context: context,
                              msg: 'Media is maandetory',
                              title: 'Failed');
                        }
                      }
                    },
                    icon: Icon(
                      Icons.near_me_outlined,
                      color: Colors.black87,
                      size: 25,
                    ),
                  ),
            const SizedBox(width: 5),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  maxLine: 10,
                  borderRadius: 10,
                  minLine: 6,
                  size: 30,
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Description required')]),
                  controller: postController.descriptionController,
                  fontSize: 14,
                  hint: "How was your training today ?",
                  borderColor: Colors.white,
                  color: Colors.white,
                ),
                // const SizedBox(height: 15),
                // InputField(
                //   size: 30,
                //   fontSize: 14,
                //   hint: "#Tags your topic in here",
                //   borderColor: Colors.white,
                //   color: Colors.white,
                // ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    openOptions(context);
                  },
                  child: media == null && postController.isEdit!
                      ? Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.only(left: 15),
                          color: Colors.grey.shade200,
                          // padding: const EdgeInsets.all(15),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              postController.imageUploded.value != ''
                                  ? postController.isVideo.value
                                      ? FutureBuilder<void>(
                                          future: postController
                                              .initializeVideoPlayerFuture
                                              .value,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return AspectRatio(
                                                aspectRatio: postController
                                                    .videoPlayerController
                                                    .value!
                                                    .value
                                                    .aspectRatio,
                                                child: VideoPlayer(
                                                    postController
                                                        .videoPlayerController
                                                        .value!),
                                              );
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        )
                                      : Image.network(
                                          mainUrl +
                                              postUrl +
                                              postController.imageUploded.value,
                                        )
                                  : Container(
                                      width: 70,
                                      height: 70,
                                    ),
                              Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                                size: 25,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.only(left: 15),
                          color: Colors.grey.shade200,
                          // padding: const EdgeInsets.all(15),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              media != null
                                  ? isVideo!
                                      ? FutureBuilder<void>(
                                          future: postController
                                              .initializeVideoPlayerFuture
                                              .value,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return AspectRatio(
                                                aspectRatio: postController
                                                    .videoPlayerController
                                                    .value!
                                                    .value
                                                    .aspectRatio,
                                                child: VideoPlayer(
                                                    postController
                                                        .videoPlayerController
                                                        .value!),
                                              );
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        )
                                      : Image.file(
                                          media!,
                                        )
                                  : Container(
                                      width: 70,
                                      height: 70,
                                    ),
                              Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
