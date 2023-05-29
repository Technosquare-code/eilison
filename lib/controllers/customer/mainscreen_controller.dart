import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainScreenController extends GetxController {
  BuildContext context;
  MainScreenController(this.context);
  var isLoading = false.obs;
  var userdetailList = List<UserDetailsModel>.empty(growable: true).obs;
  var homeCategoryList = List<HomeCategory>.empty(growable: true).obs;

  getuserdetails(BuildContext context) async {
    isLoading(true);
    userdetailList.clear();
    userdetailList.add(await MainScreenService().userdetail(context));
    if (userdetailList[0].data.homeCategory.isNotEmpty) {
      homeCategoryList.assignAll(userdetailList[0].data.homeCategory);
    }
    isLoading(false);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getuserdetails(context);
    super.onReady();
  }
}
