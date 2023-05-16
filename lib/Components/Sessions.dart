import 'dart:math' as math;
import 'dart:math';

import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../controllers/trainer/session_detail_controller.dart';

class Session extends StatelessWidget {
  final bool showDivider, isEnrolled, is_joined;
  final Color color;
  final String? img,
      title,
      category,
      time,
      date,
      duration,
      description,
      agenda,
      sessiontype,
      zoomlink,
      coach_profile_picture,
      coach_name,
      sessionId;

  Session(
      {required this.showDivider,
      required this.color,
      this.date,
      this.duration,
      this.category,
      this.img,
      this.agenda,
      this.description,
      this.sessionId,
      this.sessiontype,
      this.zoomlink,
      this.time,
      this.title,
      this.coach_profile_picture,
      this.coach_name,
      this.is_joined = false,
      this.isEnrolled = false});
  final Random _random = Random();
  final detailController = Get.find<SessionDetailController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              detailController.isUpcoming.value = false;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SessionDetailScreen(
                        coach_name: coach_name,
                        coach_profile_picture: coach_profile_picture,
                        isEnrolled: isEnrolled,
                        agenda: agenda,
                        category: category,
                        description: description,
                        duration: duration,
                        img: img,
                        isCoach: false,
                        sessionId: sessionId,
                        sessiondate: date,
                        sessiontime: time,
                        sessiontype: sessiontype,
                        zoomlink: zoomlink,
                        title: title,
                        is_joined: is_joined),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              transform: Matrix4.translationValues(25, 0, 0),
              child: Card(
                elevation: 2,
                // color: color,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadiusDirectional.only(
                //     topStart: Radius.circular(35),
                //     bottomStart: Radius.circular(35),
                //   ),
                // ),
                child: Row(
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(-35, 0, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 43,
                            backgroundColor: color,
                          ),
                          img != null
                              ? CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(mainUrl + sessionUrl + img!),
                                )
                              : CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage("assets/images/product1.PNG")),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Transform(
                        transform: Matrix4.translationValues(-35, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  //
                                  title ?? "Lower Body Workout",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  transform:
                                      Matrix4.translationValues(25, 0, 0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .primaries[_random
                                            .nextInt(Colors.primaries.length)]
                                        .shade300,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "$duration Minutes",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              //
                              category ?? "Hard Workout",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Time: $time",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Date: $date",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showDivider)
            Container(
              width: 1,
              height: 30,
              transform: Matrix4.translationValues(40, 0, 0),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey)),
              ),
            ),
        ],
      ),
    );
  }
}
