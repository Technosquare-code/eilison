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

  register(BuildContext context) async {
    try {
      isLoading(true);
      bool check = await AuthService().registerApi(
        context,
        email: email.text,
        name: fullname.text,
        password: password.text,
        phoneno: phone.text,
        usertype: selectedUser.value == 'I\'m User' ? 'customer' : 'trainer',
      );
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
}
