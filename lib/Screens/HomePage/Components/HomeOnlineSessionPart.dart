import 'dart:math';

import 'package:elison/Components/Sessions.dart';
import 'package:elison/Screens/AllSessionScreen.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeOnlineSessionPart extends StatelessWidget {
  final HomeScreenController homescreenController;

  const HomeOnlineSessionPart(this.homescreenController);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return homescreenController.isOnlineSessionLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Online Sessions',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        homescreenController.getSeeAllOnlineSessions();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllSessionScreen(
                                isenrolled: false,
                                title: 'Online Sessions',
                                sessions:
                                    homescreenController.seeAllOnlinSessionList,
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
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 3,
                  children: List.generate(
                    homescreenController.onlinSessionList.length,
                    (index) => Session(
                        coachId: homescreenController
                            .onlinSessionList[index].coachId,
                        coach_name: homescreenController
                            .onlinSessionList[index].coach_name,
                        coach_profile_picture: homescreenController
                            .onlinSessionList[index].coach_profile_picture,
                        isEnrolled: false,
                        is_joined: false,
                        date: DateFormat('d MMM y').format(homescreenController
                            .onlinSessionList[index].sessionDate),
                        duration: homescreenController
                            .onlinSessionList[index].duration,
                        img: homescreenController.onlinSessionList[index].image,
                        time: homescreenController
                            .onlinSessionList[index].sessionTime,
                        title: homescreenController
                            .onlinSessionList[index].sessionName,
                        category: homescreenController
                            .onlinSessionList[index].sessionCategoryName,
                        showDivider: index !=
                            homescreenController.onlinSessionList.length - 1,
                        agenda:
                            homescreenController.onlinSessionList[index].agenda,
                        description: homescreenController
                            .onlinSessionList[index].description,
                        sessionId:
                            homescreenController.onlinSessionList[index].id,
                        sessiontype: homescreenController
                            .onlinSessionList[index].sessionType,
                        zoomlink: homescreenController
                            .onlinSessionList[index].zoomLink,
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                ),
              ],
            );
    });
  }
}
