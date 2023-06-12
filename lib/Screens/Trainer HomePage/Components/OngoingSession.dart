import 'package:elison/Components/trainerSessionCard.dart';
import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/Screens/TrainerSessionSeeAll.dart';
import 'package:elison/controllers/trainer/session_detail_controller.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OngoingSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var homepageController = Get.find<TrainerHomeController>();
    final detailController = Get.put(SessionDetailController());
    return Obx(() {
      return homepageController.isOngoingLoading.value
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
                homepageController.ongoingsessionList.isEmpty
                    ? Center()
                    : const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongoing Sessions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    homepageController.ongoingsessionList.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TrainerSessionSeeAll(
                                      title: 'Ongoing Sessions',
                                      sessionlist:
                                          homepageController.ongoingsessionList,
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
                homepageController.ongoingsessionList.isEmpty
                    ? Center()
                    : SizedBox(
                        height: 25,
                      ),
                homepageController.ongoingsessionList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text('No data found'),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 20,
                          children: List.generate(
                              homepageController.ongoingsessionList.length >= 4
                                  ? 4
                                  : homepageController
                                      .ongoingsessionList.length,
                              (index) => InkWell(
                                    onTap: () {
                                      detailController.isUpcoming.value = false;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SessionDetailScreen(
                                              sessionId: homepageController
                                                  .ongoingsessionList[index].id,
                                              description: homepageController
                                                  .ongoingsessionList[index]
                                                  .description,
                                              img: homepageController
                                                  .ongoingsessionList[index]
                                                  .image,
                                              title: homepageController
                                                  .ongoingsessionList[index]
                                                  .sessionName,
                                              isCoach: true,
                                              agenda: homepageController
                                                  .ongoingsessionList[index]
                                                  .agenda,
                                              category: homepageController
                                                  .ongoingsessionList[index]
                                                  .sessionCategoryName,
                                              duration: homepageController
                                                  .ongoingsessionList[index]
                                                  .duration,
                                              sessiondate: homepageController
                                                  .ongoingsessionList[index]
                                                  .sessionDate,
                                              sessiontime: homepageController
                                                  .ongoingsessionList[index]
                                                  .sessionTime,
                                              sessiontype: homepageController
                                                  .ongoingsessionList[index]
                                                  .sessionType,
                                              zoomlink: homepageController
                                                  .ongoingsessionList[index]
                                                  .zoomLink,
                                            ),
                                          ));
                                    },
                                    child: TrainerSessionCard(
                                      categorytype: homepageController
                                          .ongoingsessionList[index]
                                          .sessionCategoryName,
                                      description: homepageController
                                          .ongoingsessionList[index]
                                          .description,
                                      title: homepageController
                                          .ongoingsessionList[index]
                                          .sessionName,
                                      img: homepageController
                                          .ongoingsessionList[index].image,
                                      startDate: homepageController
                                          .ongoingsessionList[index]
                                          .sessionDate,
                                      duration: homepageController
                                          .ongoingsessionList[index].duration,
                                      startTime: homepageController
                                          .ongoingsessionList[index]
                                          .sessionTime,
                                    ),
                                  )),
                        ),
                      ),
              ],
            );
    });
  }
}
