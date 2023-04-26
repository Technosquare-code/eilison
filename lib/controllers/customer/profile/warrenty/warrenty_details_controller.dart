import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';

import 'package:elison/models/support_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WarrentyController extends GetxController {
  // final bool isAdd;
  // AddAddressController(this.isAdd);
  var isLoading = false.obs;
  // var isAdd = Get.arguments;
  // final mainscreenController = Get.find<MainScreenController>();

  final name = TextEditingController();

  final email = TextEditingController();
  final productName = TextEditingController();

  final phoneNo = TextEditingController();
  final orderId = TextEditingController();
  final deliverydate = TextEditingController();
  final platformName = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    // if (!isAdd) {
    //   // yha pe address list ka data textcontrollers m dalenge
    // }
    super.onInit();
  }

  addsWarrentyDetails(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService().sendWarentyDetails(context,
        email: email.text,
        name: name.text,
        phone: phoneNo.text,
        productName: productName.text,
        deliverydate: deliverydate.text,
        orderId: orderId.text,
        platformName: platformName.text);
    if (check) {
      isLoading(false);
      Get.back();
    }
  }
}
