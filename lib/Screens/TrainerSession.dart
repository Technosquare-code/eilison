import 'dart:math' as math;

import 'package:elison/Components/SelectCategory.dart';
import 'package:elison/Components/Sessions.dart';
import 'package:elison/controllers/trainer/trainer_session_controller.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/customer/home_screen_controller.dart';
import '../models/user_session_model.dart';

class TrainerSessionScreen extends StatefulWidget {
  @override
  State<TrainerSessionScreen> createState() => _TrainerSessionScreenState();
}

class _TrainerSessionScreenState extends State<TrainerSessionScreen> {
  final sessionController =
      Get.put(TrainerSessionController(trainerId: Get.arguments[0]));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Seesions',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
        child: Column(
          children: [
            Obx(() {
              return sessionController.isLoading.value
                  ? Center(
                      child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadeShimmer(
                                    width: 50,
                                    height: 50,
                                    radius: 100,
                                    baseColor: Colors.grey.shade500,
                                    highlightColor: Colors.grey.shade300,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FadeShimmer(
                                          width: double.infinity,
                                          height: 12,
                                          radius: 15,
                                          baseColor: Colors.grey.shade500,
                                          highlightColor: Colors.grey.shade300,
                                        ),
                                        const SizedBox(height: 5),
                                        FadeShimmer(
                                          width: double.infinity,
                                          height: 10,
                                          radius: 15,
                                          baseColor: Colors.grey.shade500,
                                          highlightColor: Colors.grey.shade300,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: double.infinity,
                                height: 10,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: 6,
                    ))
                  : sessionController.sessionList.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            Center(
                              child: Text('No data found'),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount: sessionController.sessionList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) {
                            return Session(
                                isTrainerSession: true,
                                coachId:
                                    sessionController.sessionList[i].coachId,
                                isEnrolled: false,
                                date: DateFormat('d MMM y').format(
                                    DateTime.parse(sessionController
                                        .sessionList[i].sessionDate)),
                                duration:
                                    sessionController.sessionList[i].duration,
                                img: sessionController.sessionList[i].image,
                                time: sessionController
                                    .sessionList[i].sessionTime,
                                title: sessionController
                                    .sessionList[i].sessionName,
                                category: sessionController
                                    .sessionList[i].sessionCategoryName,
                                showDivider: i !=
                                    sessionController.sessionList.length - 1,
                                agenda: sessionController.sessionList[i].agenda,
                                description: sessionController
                                    .sessionList[i].description,
                                sessionId: sessionController.sessionList[i].id,
                                sessiontype: sessionController
                                    .sessionList[i].sessionType,
                                zoomlink:
                                    sessionController.sessionList[i].zoomLink,
                                color: Colors.primaries[math.Random()
                                    .nextInt(Colors.primaries.length)],
                                is_joined: false);
                          },
                        );
            }),
          ],
        ),
      ),
    );
  }
}
