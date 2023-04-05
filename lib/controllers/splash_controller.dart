import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final pref = GetStorage();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      bool isLogin = pref.read('isLogin') ?? false;
      if (isLogin) {
        pref.read('role') == '1'
            ? Get.offNamed('/user-home')
            : Get.offNamed('/trainer-home');
      } else {
        pref.read('onboarding') ?? false
            ? Get.offAndToNamed('/login-screen')
            : Get.offAndToNamed('/getting-started');
      }
    });
  }
}
