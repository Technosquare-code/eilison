import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';

import 'package:elison/models/support_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddSupportController extends GetxController {
  // final bool isAdd;
  // AddAddressController(this.isAdd);
  var isLoading = false.obs;
  // var isAdd = Get.arguments;
  // final mainscreenController = Get.find<MainScreenController>();

  final name = TextEditingController();

  final email = TextEditingController();
  final msg = TextEditingController();

  final phoneNo = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    // if (!isAdd) {
    //   // yha pe address list ka data textcontrollers m dalenge
    // }
    super.onInit();
  }

  addsupposrtmsg(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService().sendSupportmsg(context,
        email: email.text, name: name.text, phone: phoneNo.text, msg: msg.text);
    if (check) {
      isLoading(false);
      Get.back();
    }
  }
}
