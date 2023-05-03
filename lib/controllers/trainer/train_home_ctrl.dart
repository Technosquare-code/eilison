import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../apiServices/home_screen_service.dart';
import '../../models/session_list_model.dart';

class TrainerHomeController extends GetxController {
  var isLoading = false.obs;

  var sessionList = List<SessionListModel>.empty(growable: true).obs;
  var pastsessionList = List<SessionListModel>.empty(growable: true).obs;
  getSessionList() async {
    isLoading(true);
    sessionList.assignAll(await HomeScreenService().homeSessionList());
    isLoading(false);
  }

  pastSessionList() async {
    isLoading(true);
    pastsessionList.assignAll(await HomeScreenService().homePastSessionList());
    isLoading(false);
  }

  deleteSession(BuildContext context, String sessionId) async {
    bool check = await ProfileTabService()
        .deleteSessionApi(context, sessionId: sessionId);
    if (check) {
      getSessionList();
      pastSessionList();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSessionList();
    pastSessionList();
    super.onInit();
  }
}
