import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Utils/notificationService.dart';
import '../apiServices/authservice.dart';

class RegisterController extends GetxController {
  BuildContext? context;
  RegisterController({this.context});
  final pref = GetStorage();
  var isCheck = false.obs;
  var isLoading = false.obs;
  var selectedUser = 'I\'m User'.obs;
  var fullname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var confirmpassword = TextEditingController();
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

  register(BuildContext context) async {
    try {
      isLoading(true);
      bool check = await AuthService().registerApi(context,
          email: email.text,
          name: fullname.text,
          password: password.text,
          phoneno: phone.text,
          usertype: selectedUser.value == 'I\'m User' ? 'customer' : 'trainer',
          fcmtoken: fcmtoken);
      isLoading(false);
      // check ? Get.back() : null;
      // if (check) {
      //   email.clear();
      //   phone.clear();
      //   password.clear();
      //   confirmpassword.clear();
      //   fullname.clear();
      // }
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
