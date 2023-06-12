import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../apiServices/home_screen_service.dart';
import '../../models/session_list_model.dart';

class TrainerHomeController extends GetxController {
  var isLoading = false.obs;

  var sessionList = List<SessionListModel>.empty(growable: true).obs;
  var isUpcomingLoading = true.obs;

  var pastsessionList = List<SessionListModel>.empty(growable: true).obs;
  var isPastLoading = true.obs;

  var ongoingsessionList = List<SessionListModel>.empty(growable: true).obs;
  var isOngoingLoading = true.obs;

  getSessionList() async {
    isUpcomingLoading(true);
    sessionList.assignAll(await HomeScreenService().homeSessionList());
    isUpcomingLoading(false);
  }

  getOngoingList() async {
    isOngoingLoading(true);
    ongoingsessionList
        .assignAll(await HomeScreenService().ongoingSessionList());
    isOngoingLoading(false);
  }

  pastSessionList() async {
    isPastLoading(true);
    pastsessionList.assignAll(await HomeScreenService().homePastSessionList());
    isPastLoading(false);
  }

  deleteSession(BuildContext context, String sessionId) async {
    isLoading(true);
    bool check = await ProfileTabService()
        .deleteSessionApi(context, sessionId: sessionId);
    if (check) {
      getSessionList();
      pastSessionList();
    }
    isLoading(false);
  }

  updateList() async {
    isUpcomingLoading(true);
    isOngoingLoading(true);
    isPastLoading(true);
    await getSessionList();
    await getOngoingList();
    await pastSessionList();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    // isLoading(true);
    await getSessionList();
    await getOngoingList();
    await pastSessionList();
    // isLoading(false);
    super.onInit();
  }
}
