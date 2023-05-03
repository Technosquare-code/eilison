import 'package:elison/Components/TrainerPastSession.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/TrainerShimmer.dart';
import '../controllers/trainer/train_home_ctrl.dart';

class TrainerPastSessionList extends StatelessWidget {
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
            : mainscreenController.pastsessionList.isEmpty
                ? Center(
                    child: Text("No Session Found"),
                  )
                : ListView.builder(
                    itemCount: mainscreenController.pastsessionList.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, i) => TrainerPastSession(
                      description:
                          mainscreenController.pastsessionList[i].description,
                      title:
                          mainscreenController.pastsessionList[i].sessionName,
                      img: mainscreenController.pastsessionList[i].image,
                    ),
                  ),
      );
    });
  }
}
