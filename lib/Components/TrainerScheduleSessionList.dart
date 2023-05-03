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
                      title: mainscreenController.sessionList[i].sessionName,
                    ),
                  ),
      );
    });
  }
}
