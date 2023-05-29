import 'package:elison/Components/TrainerScheduleSession.dart';
import 'package:elison/Screens/TrainerShimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/trainer/train_home_ctrl.dart';

class TrainerScheduleSessionList extends StatelessWidget {
  final mainscreenController = Get.find<TrainerHomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      return Container(
        child: mainscreenController.isLoading.value
            ? TrainerHomeShimmer(
                size: size,
              )
            : mainscreenController.sessionList.isEmpty
                ? Center(
                    child: Text('No data Found'),
                  )
                : ListView.builder(
                    itemCount: mainscreenController.sessionList.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, i) => TrainerScheduleSession(
                      index: i,
                      description:
                          mainscreenController.sessionList[i].description,
                      img: mainscreenController.sessionList[i].image,
                      sessionName:
                          mainscreenController.sessionList[i].sessionName,
                      agenda: mainscreenController.sessionList[i].agenda,
                      category: mainscreenController
                          .sessionList[i].sessionCategoryName,
                      duration: mainscreenController.sessionList[i].duration,
                      sessiondate:
                          mainscreenController.sessionList[i].sessionDate,
                      sessiontime:
                          mainscreenController.sessionList[i].sessionTime,
                      sessiontype:
                          mainscreenController.sessionList[i].sessionType,
                      zoomlink: mainscreenController.sessionList[i].zoomLink,
                    ),
                  ),
      );
    });
  }
}
