import 'package:elison/Components/TrainerPastSession.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/trainer/train_home_ctrl.dart';

class TrainerPastSessionList extends StatelessWidget {
  final mainscreenController = Get.find<TrainerHomeController>();

  @override
  Widget build(BuildContext context) {
    return mainscreenController.isLoading.value
        ? CircularProgressIndicator()
        : mainscreenController.pastsessionList.isEmpty
            ? Center(
                child: Text("No Session Found"),
              )
            : ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (ctx, i) => TrainerPastSession(),
              );
  }
}
