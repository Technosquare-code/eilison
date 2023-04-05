import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {
  var isLoading = false.obs;
  var userdetailList = List<UserDetailsModel>.empty(growable: true).obs;

  getuserdetails() async {
    isLoading(true);
    userdetailList.clear();
    userdetailList.add(await MainScreenService().userdetail());
    isLoading(false);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getuserdetails();
    super.onReady();
  }
}
