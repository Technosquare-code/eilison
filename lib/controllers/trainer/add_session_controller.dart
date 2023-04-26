import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/session_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AddSessionController extends GetxController {
  final name = TextEditingController();
  final agenda = TextEditingController();
  final startTime = TextEditingController();
  final zoomlink = TextEditingController();
  final duration = TextEditingController();
  final startDate = TextEditingController();
  final description = TextEditingController();
  var isLoading = false.obs;
  var isSaving = false.obs;
  var sessionTypeList = List<SessionTypeModel>.empty(growable: true).obs;
  getSessionType() async {
    isLoading(true);
    sessionTypeList.assignAll(await HomeScreenService().sessionTypeList());
    isLoading(false);
  }

  createSession(BuildContext context,
      {String? sessionId, String? imgpath}) async {
    isSaving(true);
    bool check = await ProfileTabService().addSessionApi(context,
        agenda: agenda.text,
        current_session_photo: '',
        description: description.text,
        duration: duration.text,
        image: imgpath,
        session_id: '',
        session_name: name.text,
        session_type: sessionId,
        start_date: startDate.text,
        start_time: startTime.text,
        zoom_link: zoomlink.text);
    isSaving(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSessionType();
    super.onInit();
  }
}
