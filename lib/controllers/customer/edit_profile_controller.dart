import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  var ispictureLoading = false.obs;
  final mainscreenController = Get.find<MainScreenController>();

  final name = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  var gender = "Male".obs;
  final phoneNo = TextEditingController();
  getdetail() {
    name.text = mainscreenController.userdetailList[0].data.name;
    phoneNo.text = mainscreenController.userdetailList[0].data.phone;
    email.text = mainscreenController.userdetailList[0].data.email;
    gender.value = mainscreenController.userdetailList[0].data.gender != ''
        ? mainscreenController.userdetailList[0].data.gender
        : 'Male';
    dob.text = mainscreenController.userdetailList[0].data.dob != ''
        ? mainscreenController.userdetailList[0].data.dob
        : '';
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null)
      dob.text =
          "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getdetail();
    super.onInit();
  }

  uploadProfileImage(String? imgpath, BuildContext context) async {
    ispictureLoading(true);
    bool check =
        await ProfileTabService().profilePictureApi(context, image: imgpath);
    if (check) {
      mainscreenController.getuserdetails();
      ispictureLoading(false);
    }
    // isLoading(false);
  }

  editprofile(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService().profileUpdate(context,
        date: dob.text,
        gender: gender.value,
        name: name.text,
        phone: phoneNo.text);
    if (check) {
      mainscreenController.getuserdetails();
    }
  }
}
