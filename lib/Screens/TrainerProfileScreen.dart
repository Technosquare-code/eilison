import 'dart:io';

import 'package:elison/Components/Review.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Screens/TrainerReviewScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/edit_profile_controller.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readmore/readmore.dart';

import '../controllers/customer/mainscreen_controller.dart';

class TrainerProfileScreen extends StatefulWidget {
  static const routeName = "TrainerProfileScreen";

  @override
  State<TrainerProfileScreen> createState() => _TrainerProfileScreenState();
}

class _TrainerProfileScreenState extends State<TrainerProfileScreen> {
  final mainscreenController = Get.find<MainScreenController>();

  final editprofileController = Get.put(EditProfileController());

  File? image;

  getGalaryImage() async {
    dynamic imageData = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    setState(() {
      image = File(imageData.path);
    });
  }

  getCamImage() async {
    dynamic imageData =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(imageData.path);
    });
  }

  void openOptions(BuildContext context, bool isBg) {
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
                          await getCamImage();
                          if (image != null) {
                            isBg
                                ? editprofileController.uploadTimelineImage(
                                    image!.path, context)
                                : editprofileController.uploadProfileImage(
                                    image!.path, context);
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.photo_camera),
                      ),
                      const Text('Camera')
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
                          if (image != null) {
                            if (image != null) {
                              isBg
                                  ? editprofileController.uploadTimelineImage(
                                      image!.path, context)
                                  : editprofileController.uploadProfileImage(
                                      image!.path, context);
                              Navigator.pop(context);
                            }
                          }
                        },
                        icon: const Icon(Icons.photo),
                      ),
                      const Text('Gallery')
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return mainscreenController.isLoading.value
            ? AddressShimmer(size: size)
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    editprofileController.istimelinepictureLoading.value
                        ? CircularProgressIndicator()
                        : mainscreenController.userdetailList.isNotEmpty
                            ? mainscreenController.userdetailList[0].data
                                        .timeline_photo !=
                                    null
                                ? Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Image.network(
                                        mainUrl +
                                            timelineUrl +
                                            mainscreenController
                                                .userdetailList[0]
                                                .data
                                                .timeline_photo!,
                                        width: size.width,
                                        height: size.height / 2.5,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        child: IconButton(
                                          onPressed: () {
                                            openOptions(context, true);
                                          },
                                          icon: Icon(
                                            CupertinoIcons.camera_fill,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Image.asset(
                                    "assets/images/post.jpg",
                                    width: size.width,
                                    height: size.height / 2.5,
                                    fit: BoxFit.fill,
                                  )
                            : Image.asset(
                                "assets/images/post.jpg",
                                width: size.width,
                                height: size.height / 2.5,
                                fit: BoxFit.fill,
                              ),
                    Container(
                      transform: Matrix4.translationValues(0, -15, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:
                                    editprofileController.ispictureLoading.value
                                        ? CircularProgressIndicator()
                                        : mainscreenController
                                                .userdetailList.isNotEmpty
                                            ? mainscreenController
                                                        .userdetailList[0]
                                                        .data
                                                        .profilePicture !=
                                                    null
                                                ? Image.network(
                                                    mainUrl +
                                                        imageUrl +
                                                        mainscreenController
                                                            .userdetailList[0]
                                                            .data
                                                            .profilePicture!,
                                                    width: size.width / 5,
                                                    height: size.width / 5,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    "assets/images/product2.PNG",
                                                    width: size.width / 5,
                                                    height: size.width / 5,
                                                    fit: BoxFit.fill,
                                                  )
                                            : Image.asset(
                                                "assets/images/product2.PNG",
                                                width: size.width / 5,
                                                height: size.width / 5,
                                                fit: BoxFit.fill,
                                              ),
                              ),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    openOptions(context, false);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      CupertinoIcons.camera_fill,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  mainscreenController.userdetailList.isNotEmpty
                                      ? mainscreenController
                                          .userdetailList[0].data.name
                                      : "User",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReadMoreText(
                            mainscreenController.userdetailList.isNotEmpty
                                ? mainscreenController
                                    .userdetailList[0].data.bio
                                : 'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being. Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being.',
                            trimLines: 4,
                            delimiter: '  ',
                            textAlign: TextAlign.justify,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read More...',
                            trimExpandedText: '',
                            colorClickableText: primaryColor,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                            moreStyle: TextStyle(
                              fontSize: 12,
                              color: primaryColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/trainer-sessions',
                                      arguments: mainscreenController
                                          .userdetailList[0].data.id);
                                },
                                child: Statistics(
                                  "Sessions",
                                  Text(
                                    mainscreenController
                                            .userdetailList.isNotEmpty
                                        ? mainscreenController.userdetailList[0]
                                            .data.total_session!
                                        : "15",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/review', arguments: [
                                    GetStorage().read('user_id')
                                  ]);
                                  // Navigator.of(context).pushNamed(
                                  //   TrainerReviewScreen.routeName,
                                  // );
                                },
                                child: Statistics(
                                  "${mainscreenController.userdetailList.isNotEmpty ? mainscreenController.userdetailList[0].data.avg_rating : '0'} Ratings",
                                  RatingBar.builder(
                                    initialRating: double.parse(
                                        mainscreenController
                                                .userdetailList.isNotEmpty
                                            ? mainscreenController
                                                .userdetailList[0]
                                                .data
                                                .avg_rating!
                                            : '5'),
                                    minRating: 1,
                                    itemSize: 20,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0.5),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (_) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}

class Statistics extends StatelessWidget {
  final Widget widget;
  final String statistic;

  const Statistics(
    this.statistic,
    this.widget,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2.25,
      height: 90,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: widget,
          ),
          const Expanded(child: SizedBox()),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              children: [
                Text(
                  statistic,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 1.5,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
