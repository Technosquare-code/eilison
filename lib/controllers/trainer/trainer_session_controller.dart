import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../apiServices/home_screen_service.dart';
import '../../models/session_list_model.dart';

class TrainerSessionController extends GetxController {
  String? trainerId;
  TrainerSessionController({this.trainerId});
  var isLoading = false.obs;

  var sessionList = List<SessionListModel>.empty(growable: true).obs;

  getSessionList(String trainerId) async {
    // isLoading(true);
    sessionList
        .assignAll(await HomeScreenService().trainerSessionList(trainerId));
    // isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    isLoading(true);
    await getSessionList(trainerId!);

    isLoading(false);
    super.onInit();
  }
}
