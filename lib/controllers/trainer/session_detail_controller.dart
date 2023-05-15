import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customer/home_screen_controller.dart';

class SessionDetailController extends GetxController {
  var isUpcoming = false.obs;
  var isLoading = false.obs;

  startSession(BuildContext context, String sessionId, zoomlink) async {
    isLoading(true);
    bool check = await MainScreenService()
        .startSessionApi(context, session_id: sessionId);
    final homepageController = Get.find<TrainerHomeController>();

    if (check) {
      homepageController.getSessionList();
      homepageController.getOngoingList();
      if (await canLaunch(zoomlink!)) {
        await launch(zoomlink!);
      }
      isUpcoming(false);
    }
    isLoading(false);
  }

  joinSession(BuildContext context, String sessionId, zoomlink) async {
    isLoading(true);
    bool check = await MainScreenService()
        .joinSessionApi(context, session_id: sessionId);
    // final homepageController = Get.find<TrainerHomeController>();

    if (check) {
      // homepageController.getSessionList();
      // homepageController.getOngoingList();
      if (await canLaunch(zoomlink!)) {
        await launch(zoomlink!);
      }
    }
    isLoading(false);
  }

  enrollSession(BuildContext context, String sessionId) async {
    isLoading(true);
    bool check = await HomeScreenService().enrollSession(context, sessionId);
    final homeController = Get.find<HomeScreenController>();
    if (check) {
      print('enroll true----------------');
      homeController.enrolledSessionList.clear();
      // homeController.onlinSessionList.clear();
      await homeController.getEnrollSessions('home');
      // await homeController.getOnlineSessions('home');
    }
    isLoading(false);
  }

  endSession(BuildContext context, String sessionId) async {
    isLoading(true);
    bool check =
        await MainScreenService().endSessionApi(context, session_id: sessionId);
    final homepageController = Get.find<TrainerHomeController>();

    if (check) {
      // homepageController.getSessionList();
      homepageController.getOngoingList();
      homepageController.pastSessionList();

      isUpcoming(false);
      Get.back();
    }
    isLoading(false);
  }
}
