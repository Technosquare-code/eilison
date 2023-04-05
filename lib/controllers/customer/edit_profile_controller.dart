import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  final mainscreenController = Get.find<MainScreenController>();

  final name = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  final phoneNo = TextEditingController();
  getdetail() {
    name.text = mainscreenController.userdetailList[0].data.name;
    phoneNo.text = mainscreenController.userdetailList[0].data.phone;
    email.text = mainscreenController.userdetailList[0].data.email;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getdetail();
    super.onInit();
  }

  editprofile() async {
    isLoading(true);
  }
}
