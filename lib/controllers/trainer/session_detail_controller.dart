import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetailController extends GetxController {
  var isUpcoming = false.obs;
  var isLoading = false.obs;
  final homepageController = Get.find<TrainerHomeController>();

  startSession(BuildContext context, String sessionId, zoomlink) async {
    isLoading(true);
    bool check = await MainScreenService()
        .startSessionApi(context, session_id: sessionId);
    if (check) {
      isUpcoming(false);
      homepageController.getSessionList();
      homepageController.getOngoingList();
      if (await canLaunch(zoomlink!)) {
        await launch(zoomlink!);
      }
    }
    isLoading(false);
  }
}
