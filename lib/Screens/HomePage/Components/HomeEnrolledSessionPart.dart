import 'dart:math';

import 'package:elison/Components/Sessions.dart';
import 'package:elison/Screens/AllSessionScreen.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeEnrolledSessionPart extends StatelessWidget {
  final HomeScreenController homescreenController;

  const HomeEnrolledSessionPart(this.homescreenController);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return homescreenController.isEnrolledSessionLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeShimmer(
                  height: 8,
                  radius: 15,
                  width: size.width / 4,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeShimmer.round(
                      size: 70,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeShimmer(
                            height: 8,
                            radius: 15,
                            width: size.width / 4,
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 10),
                          FadeShimmer(
                            height: 8,
                            radius: 15,
                            width: size.width / 3,
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 15),
                          FadeShimmer(
                            height: 8,
                            radius: 15,
                            width: size.width / 4,
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                  height: 45,
                  child: VerticalDivider(thickness: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeShimmer.round(
                      size: 70,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeShimmer(
                            height: 8,
                            radius: 15,
                            width: size.width / 4,
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 10),
                          FadeShimmer(
                            height: 8,
                            radius: 15,
                            width: size.width / 3,
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 15),
                          FadeShimmer(
                            height: 8,
                            radius: 15,
                            width: size.width / 4,
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homescreenController.enrolledSessionList.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enrolled Sessions',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          homescreenController.enrolledSessionList.isNotEmpty
                              ? InkWell(
                                  onTap: () {
                                    homescreenController
                                        .getSeeAllEnrolledSessions();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AllSessionScreen(
                                            title: 'Enrolled Sessions',
                                            isenrolled: true,
                                            sessions: homescreenController
                                                .seeAllEnrolledSessionList,
                                          ),
                                        ));
                                  },
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      )
                    : Container(),
                const SizedBox(height: 15),
                homescreenController.enrolledSessionList.isNotEmpty
                    ? Wrap(
                        spacing: 3,
                        children: List.generate(
                          homescreenController.enrolledSessionList.length,
                          (index) => Session(
                              coachId: homescreenController
                                  .enrolledSessionList[index].coachId,
                              coach_name: homescreenController
                                  .enrolledSessionList[index].coach_name,
                              coach_profile_picture: homescreenController
                                  .enrolledSessionList[index]
                                  .coach_profile_picture,
                              isEnrolled: true,
                              date: DateFormat('d MMM y').format(homescreenController
                                  .enrolledSessionList[index].sessionDate),
                              duration: homescreenController
                                  .enrolledSessionList[index].duration,
                              img: homescreenController
                                  .enrolledSessionList[index].image,
                              time: homescreenController
                                  .enrolledSessionList[index].sessionTime,
                              title: homescreenController
                                  .enrolledSessionList[index].sessionName,
                              category: homescreenController
                                  .enrolledSessionList[index]
                                  .sessionCategoryName,
                              showDivider: index !=
                                  homescreenController.enrolledSessionList.length -
                                      1,
                              agenda: homescreenController
                                  .enrolledSessionList[index].agenda,
                              description: homescreenController
                                  .enrolledSessionList[index].description,
                              sessionId: homescreenController
                                  .enrolledSessionList[index].id,
                              sessiontype: homescreenController
                                  .enrolledSessionList[index].sessionType,
                              zoomlink: homescreenController
                                  .enrolledSessionList[index].zoomLink,
                              color: Colors
                                  .primaries[Random().nextInt(Colors.primaries.length)],
                              is_joined: homescreenController.enrolledSessionList[index].is_joined ?? false),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(child: Text('No Data Found')),
                      ),
              ],
            );
    });
  }
}
