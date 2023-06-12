import 'package:elison/Components/trainerSessionCard.dart';
import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/Screens/TrainerSessionSeeAll.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PastSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var homepageController = Get.find<TrainerHomeController>();
    return Obx(() {
      return homepageController.isPastLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeShimmer(
                  height: 8,
                  radius: 15,
                  width: size.width / 2,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    spacing: 15,
                    children: List.generate(
                      4,
                      (index) => FadeShimmer(
                        radius: 15,
                        height: size.height / 4,
                        width: size.width / 1.5,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homepageController.pastsessionList.isEmpty
                    ? Center()
                    : const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Past Sessions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    homepageController.pastsessionList.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TrainerSessionSeeAll(
                                      title: 'Past Sessions',
                                      sessionlist:
                                          homepageController.pastsessionList,
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
                ),
                homepageController.pastsessionList.isEmpty
                    ? Center()
                    : SizedBox(
                        height: 25,
                      ),
                homepageController.pastsessionList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text('No data found'),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 20,
                            children: List.generate(
                                homepageController.pastsessionList.length >= 4
                                    ? 4
                                    : homepageController.pastsessionList.length,
                                (index) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SessionDetailScreen(
                                                sessionId: homepageController
                                                    .pastsessionList[index].id,
                                                isPast: true,
                                                description: homepageController
                                                    .pastsessionList[index]
                                                    .description,
                                                img: homepageController
                                                    .pastsessionList[index]
                                                    .image,
                                                title: homepageController
                                                    .pastsessionList[index]
                                                    .sessionName,
                                                isCoach: true,
                                                agenda: homepageController
                                                    .pastsessionList[index]
                                                    .agenda,
                                                category: homepageController
                                                    .pastsessionList[index]
                                                    .sessionCategoryName,
                                                duration: homepageController
                                                    .pastsessionList[index]
                                                    .duration,
                                                sessiondate: homepageController
                                                    .pastsessionList[index]
                                                    .sessionDate,
                                                sessiontime: homepageController
                                                    .pastsessionList[index]
                                                    .sessionTime,
                                                sessiontype: homepageController
                                                    .pastsessionList[index]
                                                    .sessionType,
                                                zoomlink: homepageController
                                                    .pastsessionList[index]
                                                    .zoomLink,
                                              ),
                                            ));
                                      },
                                      child: TrainerSessionCard(
                                        ispast: true,
                                        categorytype: homepageController
                                            .pastsessionList[index]
                                            .sessionCategoryName,
                                        description: homepageController
                                            .pastsessionList[index].description,
                                        title: homepageController
                                            .pastsessionList[index].sessionName,
                                        img: homepageController
                                            .pastsessionList[index].image,
                                        startDate: homepageController
                                            .pastsessionList[index].sessionDate,
                                        duration: homepageController
                                            .pastsessionList[index].duration,
                                        startTime: homepageController
                                            .pastsessionList[index].sessionTime,
                                      ),
                                    )),
                          ),
                        ),
                      ),
              ],
            );
    });
  }
}
