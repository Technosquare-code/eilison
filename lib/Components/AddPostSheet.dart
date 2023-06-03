import 'dart:io';

import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/snackbar.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../controllers/customer/posts/add_edit_post_controller.dart';
import '../controllers/customer/profile/support/add_support_controller.dart';

class AddPostSheet extends StatefulWidget {
  int index;
  bool isedit;
  Function onDeleteController; // New callback function
  AddPostSheet(this.index, this.isedit,
      {required this.onDeleteController}); // Pass the callback function to the constructor

  @override
  State<AddPostSheet> createState() => _AddPostSheetState();
}

class _AddPostSheetState extends State<AddPostSheet> {
  // final String? orderId;
  File? media;

  bool? isVideo = false;

  late AddEditPostController postController;

  @override
  void initState() {
    super.initState();
    postController = Get.put(
      AddEditPostController(index: widget.index, isEdit: widget.isedit),
    );
  }

  final _formKey = GlobalKey<FormState>();

  // VideoPlayerController? _videoPlayerController;
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
  void dispose() {
    postController.dispose();
    widget.onDeleteController(); // Invoke the callback function
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 12,
              width: size.width / 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Add Post",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Form(
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
          const SizedBox(height: 25),
          MyButton(
            fontSize: 16,
            title: postController.isLoading.value ? 'Please Wait...' : "Submit",
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
            sizeHieght: 50,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                if (media != null || postController.isEdit!) {
                  postController.addpost(media ?? null, context, !isVideo!);
                } else {
                  snackbar(
                      context: context,
                      msg: 'Media is maandetory',
                      snackPosition: SnackPosition.TOP,
                      title: 'Failed');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
