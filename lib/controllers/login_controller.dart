import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../apiServices/authservice.dart';

class LoginController extends GetxController {
  final pref = GetStorage();
  var isCheck = false.obs;
  var isLoading = false.obs;
  var selectedUser = 'I\'m User'.obs;

  var email = TextEditingController();
  var forgotemail = TextEditingController();
  var password = TextEditingController();

  login(BuildContext context) async {
// final isValid = loginFormKey.currentState!.validate();

    // if (!isValid) {
    //   return;
    // }
    try {
      isLoading(true);
      bool check = await AuthService().loginApi(
        context,
        email: email.text,
        password: password.text,
      );
      isLoading(false);
      if (check) {
        String role = pref.read('role');
        (role == '2')
            ? Get.toNamed('/trainer-home')
            : Get.offAllNamed('/user-home');
      }
      // Get.back();
    } catch (e) {
      debugPrint(e.toString());

      // Get.snackbar("Failed", "Failed to Login");
      isLoading(false);
    }
  }

  forgotpassword(BuildContext context) async {
// final isValid = loginFormKey.currentState!.validate();

    // if (!isValid) {
    //   return;
    // }
    try {
      isLoading(true);
      bool check = await AuthService().forgotpassApi(
        context,
        email: forgotemail.text,
      );
      isLoading(false);

      check ? Get.back() : null;
    } catch (e) {
      debugPrint(e.toString());

      // Get.snackbar("Failed", "Failed to Login");
      isLoading(false);
    }
  }
}
