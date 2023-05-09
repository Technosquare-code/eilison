import 'package:elison/apiServices/mainscreenService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetailController extends GetxController {
  var isUpcoming = false.obs;
  startSession(BuildContext context, String sessionId, zoomlink) async {
    bool check = await MainScreenService()
        .startSessionApi(context, session_id: sessionId);
    if (check) {
      isUpcoming(false);
      if (await canLaunch(zoomlink!)) {
        await launch(zoomlink!);
      }
    }
  }
}
