import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/RateTrainer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/trainer/session_detail_controller.dart';

class SessionDetailScreen extends StatelessWidget {
  bool? isCoach, isPast, isEnrolled, is_joined;
  String? img,
      title,
      description,
      agenda,
      sessiontype,
      sessiondate,
      sessiontime,
      duration,
      zoomlink,
      sessionId,
      category;
  SessionDetailScreen(
      {this.description,
      this.img,
      this.title,
      this.isPast = false,
      this.isCoach,
      this.agenda,
      this.category,
      this.duration,
      this.sessionId,
      this.sessiondate,
      this.sessiontime,
      this.sessiontype,
      this.isEnrolled = false,
      this.is_joined = false,
      this.zoomlink});

  final detailController = Get.find<SessionDetailController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          // padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    mainUrl + sessionUrl + img!,
                    // "assets/images/session.PNG",
                    width: size.width,
                    height: size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          is_joined.toString() ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        isCoach! || !isEnrolled!
                            ? Container(
                                child: Text(''),
                              )
                            : is_joined ?? false
                                ? InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          content: RateTrainer(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: secondaryColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 13,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "Rate",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      category ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          '${sessiondate}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 2,
                            height: 20,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          '${sessiontime}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            width: 2,
                            height: 20,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          '${duration} min',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Text(
                          'Agenda',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Spacer(),
                        // InkWell(
                        //   onTap: () async {
                        //     if (await canLaunch(zoomlink!)) {
                        //       await launch(zoomlink!);
                        //     }
                        //   },
                        //   child: Text(
                        //     'Join Link',
                        //     style: TextStyle(
                        //       fontSize: 14,
                        //       color: Colors.red,
                        //       fontFamily: "Poppins",
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${agenda}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    ReadMoreText(
                      description ?? '',
                      // 'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide. A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread.',
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
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: isCoach!
            ? isPast!
                ? Container(
                    height: 0,
                  )
                : Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: detailController.isUpcoming.value
                        ? MyButton(
                            fontSize: 16,
                            sizeHieght: 50,
                            title: "Start Now",
                            textColor: Colors.white,
                            onTap: () {
                              detailController.startSession(
                                  context, sessionId!, zoomlink);
                            },
                          )
                        : MyButton(
                            fontSize: 16,
                            sizeHieght: 50,
                            title: "End Now",
                            textColor: Colors.white,
                            onTap: () {
                              detailController.endSession(context, sessionId!);
                            },
                          ),
                  )
            : isEnrolled!
                ? Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: MyButton(
                      fontSize: 16,
                      sizeHieght: 50,
                      title: detailController.isLoading.value
                          ? 'loading...'
                          : "Join Now",
                      textColor: Colors.white,
                      onTap: () async {
                        // if (await canLaunch(zoomlink!)) {
                        //   await launch(zoomlink!);
                        // }
                        detailController.joinSession(
                            context, sessionId!, zoomlink);
                      },
                    ),
                  )
                : Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                    child: MyButton(
                      fontSize: 16,
                      sizeHieght: 50,
                      title: detailController.isLoading.value
                          ? 'loading...'
                          : "Enroll Now",
                      textColor: Colors.white,
                      onTap: () {
                        detailController.enrollSession(context, sessionId!);
                      },
                    ),
                  ),
      );
    });
  }
}
