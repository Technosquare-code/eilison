import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../apiServices/authservice.dart';

class RegisterController extends GetxController {
  final pref = GetStorage();
  var isCheck = false.obs;
  var isLoading = false.obs;
  var selectedUser = 'I\'m User'.obs;
  var fullname = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  var confirmpassword = TextEditingController();

  register() async {
    try {
      isLoading(true);
      bool check = await AuthService().registerApi(
        email: email.text,
        name: fullname.text,
        password: password.text,
        phoneno: phone,
        usertype: selectedUser.value == 'I\'m User' ? 'customer' : 'trainer',
      );
      isLoading(false);
      Get.back();
    } catch (e) {
      debugPrint(e.toString());

      // Get.snackbar("Failed", "Failed to Login");
      isLoading(false);
    }
  }
}
