import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbar({
  String? msg,
  String? title,
  BuildContext? context,
}) {
  Get.snackbar(title!, msg!,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black,
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      margin: EdgeInsets.only(bottom: 50),
      maxWidth: MediaQuery.of(context!).size.width * 0.8);
}
