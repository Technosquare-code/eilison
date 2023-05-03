import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/controllers/trainer/train_home_ctrl.dart';
import 'package:elison/models/session_type_model.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../customer/mainscreen_controller.dart';

class AddSessionController extends GetxController {
  bool? isEdit;
  int? index;
  AddSessionController({this.isEdit, this.index});
  final name = TextEditingController();
  final agenda = TextEditingController();
  final startTime = TextEditingController();
  final zoomlink = TextEditingController();
  final duration = TextEditingController();
  final startDate = TextEditingController();
  final description = TextEditingController();
  var isLoading = false.obs;
  var isSaving = false.obs;

  var sessiontype = ''.obs;
  var imageUploded = ''.obs;

  var sessionIId = ''.obs;
  var sessionTypeList = List<SessionTypeModel>.empty(growable: true).obs;
  final mainscreenController = Get.find<TrainerHomeController>();

  getSessionType() async {
    isLoading(true);
    sessionTypeList.assignAll(await HomeScreenService().sessionTypeList());
    print(sessionTypeList.length);
    isLoading(false);
  }

  createSession(BuildContext context,
      {String? sessiontypeId, String? imgpath, String? sessionId}) async {
    isSaving(true);
    bool check = await ProfileTabService().addSessionApi(context,
        agenda: agenda.text,
        description: description.text,
        duration: duration.text,
        image: imgpath,
        imgpath: imageUploded.value,
        session_id: sessionId != '' ? sessionId : '',
        session_name: name.text,
        session_type: sessiontypeId,
        start_date: startDate.text,
        start_time: startTime.text,
        zoom_link: zoomlink.text);
    if (check) {
      mainscreenController.getSessionList();
    }
    isSaving(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSessionType();
    if (isEdit!) {
      List date =
          mainscreenController.sessionList[index!].sessionDate.split('-');
      print('date length--------${date}');
      startDate.text = date[2] + '/' + date[1] + '/' + date[0];

      name.text = mainscreenController.sessionList[index!].sessionName;
      agenda.text = mainscreenController.sessionList[index!].agenda;
      startTime.text = mainscreenController.sessionList[index!].sessionTime;
      zoomlink.text = mainscreenController.sessionList[index!].zoomLink;
      duration.text = mainscreenController.sessionList[index!].duration;

      // startDate.text = mainscreenController.sessionList[index!].sessionDate;
      description.text = mainscreenController.sessionList[index!].description;
      sessionIId.value = mainscreenController.sessionList[index!].id;
      sessiontype.value = mainscreenController.sessionList[index!].sessionType;
      imageUploded.value = mainscreenController.sessionList[index!].image;
    }
    super.onInit();
  }
}
