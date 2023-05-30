import 'dart:math' as math;

import 'package:elison/Components/Sessions.dart';
import 'package:elison/Components/shimmer/SessionScreenLoading.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/controllers/customer/profile/mysessions/mysessions_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MySessionScreen extends StatelessWidget {
  static const routeName = "MySessionScreen";
  final sessionController = Get.put(MySessionsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          "My Sessions",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        return sessionController.isLoading.value
            ? SessionScreenLoading()
            : SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(25, 15, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OnGoing Sessions',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    sessionController.ongoingSessionList.isNotEmpty
                        ? Wrap(
                            spacing: 3,
                            children: List.generate(
                              sessionController.ongoingSessionList.length,
                              (index) => Session(
                                  coachId: sessionController
                                      .ongoingSessionList[index].coachId,
                                  coach_name: sessionController
                                      .ongoingSessionList[index].coach_name,
                                  coach_profile_picture: sessionController
                                      .ongoingSessionList[index]
                                      .coach_profile_picture,
                                  isEnrolled: true,
                                  date: DateFormat('d MMM y').format(
                                      sessionController
                                          .ongoingSessionList[index]
                                          .sessionDate),
                                  duration: sessionController
                                      .ongoingSessionList[index].duration,
                                  img: sessionController
                                      .ongoingSessionList[index].image,
                                  time: sessionController
                                      .ongoingSessionList[index].sessionTime,
                                  title: sessionController
                                      .ongoingSessionList[index].sessionName,
                                  category: sessionController
                                      .ongoingSessionList[index]
                                      .sessionCategoryName,
                                  showDivider: index !=
                                      sessionController.ongoingSessionList.length -
                                          1,
                                  agenda: sessionController
                                      .ongoingSessionList[index].agenda,
                                  description: sessionController
                                      .ongoingSessionList[index].description,
                                  sessionId: sessionController
                                      .ongoingSessionList[index].id,
                                  sessiontype: sessionController
                                      .ongoingSessionList[index].sessionType,
                                  zoomlink: sessionController
                                      .ongoingSessionList[index].zoomLink,
                                  color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
                                  is_joined: sessionController.ongoingSessionList[index].is_joined ?? false),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(child: Text('No Data Found')),
                          ),
                    // const SizedBox(height: 25),
                    // Text(
                    //   'UpComing Sessions',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.black,
                    //     fontFamily: "Poppins",
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    // Session(
                    //   showDivider: true,
                    //   color: Colors.primaries[
                    //       math.Random().nextInt(Colors.primaries.length)],
                    // ),
                    // Session(
                    //   showDivider: false,
                    //   color: Colors.primaries[
                    //       math.Random().nextInt(Colors.primaries.length)],
                    // ),
                    const SizedBox(height: 25),
                    Text(
                      'Completed Sessions',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    sessionController.completedSessionList.isNotEmpty
                        ? Wrap(
                            spacing: 3,
                            children: List.generate(
                              sessionController.completedSessionList.length,
                              (index) => Session(
                                  coachId: sessionController
                                      .completedSessionList[index].coachId,
                                  coach_name: sessionController
                                      .completedSessionList[index].coach_name,
                                  coach_profile_picture: sessionController
                                      .completedSessionList[index]
                                      .coach_profile_picture,
                                  isEnrolled: true,
                                  date: DateFormat('d MMM y').format(
                                      sessionController
                                          .completedSessionList[index]
                                          .sessionDate),
                                  duration: sessionController
                                      .completedSessionList[index].duration,
                                  img: sessionController
                                      .completedSessionList[index].image,
                                  time: sessionController
                                      .completedSessionList[index].sessionTime,
                                  title: sessionController
                                      .completedSessionList[index].sessionName,
                                  category: sessionController
                                      .completedSessionList[index]
                                      .sessionCategoryName,
                                  showDivider: index !=
                                      sessionController.completedSessionList.length -
                                          1,
                                  agenda: sessionController
                                      .completedSessionList[index].agenda,
                                  description: sessionController
                                      .completedSessionList[index].description,
                                  sessionId: sessionController
                                      .completedSessionList[index].id,
                                  sessiontype: sessionController
                                      .completedSessionList[index].sessionType,
                                  zoomlink: sessionController
                                      .completedSessionList[index].zoomLink,
                                  color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
                                  is_joined: sessionController.completedSessionList[index].is_joined ?? false),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(child: Text('No Data Found')),
                          ),
                  ],
                ),
              );
      }),
    );
  }
}
