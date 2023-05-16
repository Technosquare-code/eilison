import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/address_model.dart';
import 'package:elison/models/order_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/models/user_session_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MySessionsController extends GetxController {
  var isLoading = false.obs;
  // final mainscreenController = Get.find<MainScreenController>();

  var completedSessionList = List<UserSessionModel>.empty(growable: true).obs;
  var ongoingSessionList = List<UserSessionModel>.empty(growable: true).obs;

  getCompletedSession() async {
    isLoading(true);
    completedSessionList
        .assignAll(await HomeScreenService().completedSessionList());
    // isLoading(false);
  }

  getOngoingSession() async {
    isLoading(true);
    ongoingSessionList
        .assignAll(await HomeScreenService().ongoingMySessionList());
    // isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getOngoingSession();
    await getCompletedSession();
    isLoading(false);
    super.onInit();
  }
}
