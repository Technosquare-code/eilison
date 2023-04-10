import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangepasController extends GetxController {
  var isLoading = false.obs;
  // var isAdd = Get.arguments;
  // final mainscreenController = Get.find<MainScreenController>();

  final current = TextEditingController();
  final confirmpas = TextEditingController();
  final newpass = TextEditingController();

  changepass(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService()
        .changePass(context, current: current.text, newpas: newpass.text);
    check ? Get.back() : null;
    isLoading(false);
  }
}
