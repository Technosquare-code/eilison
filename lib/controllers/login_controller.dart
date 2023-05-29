import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Utils/notificationService.dart';
import '../apiServices/authservice.dart';

class LoginController extends GetxController {
  BuildContext? context;
  LoginController({this.context});
  final pref = GetStorage();
  var isCheck = false.obs;
  var isLoading = false.obs;
  var selectedUser = 'I\'m User'.obs;

  var email = TextEditingController();
  var forgotemail = TextEditingController();
  var password = TextEditingController();
  String? fcmtoken = '';
  Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    showDialog(
      context: context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? ''),
        content: Text(body ?? ''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {},
          )
        ],
      ),
    );
  }

  updateFcmToken() async {
    FirebaseNotification().setUpFirebase(onDidReceiveLocalNotification);

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    fcmtoken = await messaging.getToken();
  }

  login(BuildContext context) async {
// final isValid = loginFormKey.currentState!.validate();

    // if (!isValid) {
    //   return;
    // }
    try {
      isLoading(true);
      bool check = await AuthService().loginApi(context,
          email: email.text, password: password.text, fcomtoken: fcmtoken);
      isLoading(false);
      if (check) {
        String role = pref.read('role');
        (role == '2')
            ? Get.toNamed('/trainer-home', arguments: [context])
            : Get.offAllNamed('/user-home', arguments: [context]);
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
    } catch (e) {
      debugPrint(e.toString());

      // Get.snackbar("Failed", "Failed to Login");
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    updateFcmToken();
    super.onInit();
  }
}
