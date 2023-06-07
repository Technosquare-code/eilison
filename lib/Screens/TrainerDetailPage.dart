import 'package:cached_network_image/cached_network_image.dart';
import 'package:elison/Components/Review.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Screens/TrainerReviewScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/trainer_details_controller.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class TrainerDetailPage extends StatelessWidget {
  final trainerController =
      Get.put(TrainerDetailsController(trainerid: Get.arguments[0]));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
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
            "Trainer",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: trainerController.isLoading.value
            ? AddressShimmer(size: size)
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    trainerController.userDetails[0].data.timeline_photo != null
                        ? CachedNetworkImage(
                            imageUrl: mainUrl +
                                timelineUrl +
                                trainerController
                                    .userDetails[0].data.timeline_photo!,
                            width: size.width,
                            height: size.height / 2.5,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          )
                        // Image.network(
                        //     mainUrl +
                        //         timelineUrl +
                        //         trainerController
                        //             .userDetails[0].data.timeline_photo!,
                        //     width: size.width,
                        //     height: size.height / 2.5,
                        //     fit: BoxFit.fill,
                        //   )
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: (trainerController.userDetails[0].data
                                            .profilePicture !=
                                        null &&
                                    trainerController.userDetails[0].data
                                            .profilePicture !=
                                        '')
                                ? CachedNetworkImage(
                                    imageUrl: mainUrl +
                                        imageUrl +
                                        trainerController.userDetails[0].data
                                            .profilePicture!,
                                    width: size.width / 5,
                                    height: size.width / 5,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                                //  Image.network(
                                //     mainUrl +
                                //         imageUrl +
                                //         trainerController.userDetails[0].data
                                //             .profilePicture!,
                                //     width: size.width / 5,
                                //     height: size.width / 5,
                                //     fit: BoxFit.fill,
                                //   )
                                : Image.network(
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                    width: size.width / 5,
                                    height: size.width / 5,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  trainerController.userDetails[0].data.name ??
                                      "Srija Banerjee",
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
                            trainerController
                                    .userDetails[0].data.profilePicture ??
                                'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being. Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being.',
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
                                      arguments: trainerController
                                          .userDetails[0].data.id);
                                },
                                child: Statistics(
                                  "Sessions",
                                  Text(
                                    trainerController.userDetails[0].data
                                            .total_session ??
                                        "15",
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
                                    trainerController.userDetails[0].data.id
                                  ]);
                                },
                                child: Statistics(
                                  "${trainerController.userDetails[0].data.avg_rating} Ratings",
                                  RatingBar.builder(
                                    initialRating: double.parse(
                                        trainerController.userDetails[0].data
                                                .avg_rating ??
                                            '3'),
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
              ),
      );
    });
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
