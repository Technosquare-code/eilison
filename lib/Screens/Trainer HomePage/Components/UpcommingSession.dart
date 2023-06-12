import 'package:elison/Components/trainerSessionCard.dart';
import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/Screens/TrainerSessionSeeAll.dart';
import 'package:elison/controllers/trainer/session_detail_controller.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var homepageController = Get.find<TrainerHomeController>();
    final detailController = Get.put(SessionDetailController());
    return Obx(() {
      return homepageController.isUpcomingLoading.value
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Sessions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    homepageController.sessionList.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainerSessionSeeAll(
                                    title: 'Upcoming Sessions',
                                    sessionlist: homepageController.sessionList,
                                  ),
                                ),
                              );
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
                homepageController.sessionList.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text('No data Found'),
                        ),
                      )
                    : SizedBox(
                        height: 25,
                      ),
                homepageController.sessionList.isEmpty
                    ? Center()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 20,
                          children: List.generate(
                              homepageController.sessionList.length >= 4
                                  ? 4
                                  : homepageController.sessionList.length,
                              (index) => InkWell(
                                    onTap: () {
                                      detailController.isUpcoming.value = true;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SessionDetailScreen(
                                              sessionId: homepageController
                                                  .sessionList[index].id,
                                              description: homepageController
                                                  .sessionList[index]
                                                  .description,
                                              img: homepageController
                                                  .sessionList[index].image,
                                              title: homepageController
                                                  .sessionList[index]
                                                  .sessionName,
                                              isCoach: true,
                                              agenda: homepageController
                                                  .sessionList[index].agenda,
                                              category: homepageController
                                                  .sessionList[index]
                                                  .sessionCategoryName,
                                              duration: homepageController
                                                  .sessionList[index].duration,
                                              sessiondate: homepageController
                                                  .sessionList[index]
                                                  .sessionDate,
                                              sessiontime: homepageController
                                                  .sessionList[index]
                                                  .sessionTime,
                                              sessiontype: homepageController
                                                  .sessionList[index]
                                                  .sessionType,
                                              zoomlink: homepageController
                                                  .sessionList[index].zoomLink,
                                            ),
                                          ));
                                    },
                                    child: TrainerSessionCard(
                                      isUpcoming: true,
                                      categorytype: homepageController
                                          .sessionList[index]
                                          .sessionCategoryName,
                                      description: homepageController
                                          .sessionList[index].description,
                                      title: homepageController
                                          .sessionList[index].sessionName,
                                      index: index,
                                      img: homepageController
                                          .sessionList[index].image,
                                      startDate: homepageController
                                          .sessionList[index].sessionDate,
                                      duration: homepageController
                                          .sessionList[index].duration,
                                      startTime: homepageController
                                          .sessionList[index].sessionTime,
                                    ),
                                  )),
                        ),
                      ),
              ],
            );
    });
  }
}
