import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class HomeScreenController extends GetxController {
  var isLoading = false.obs;
  final mainscreenController = Get.find<MainScreenController>();
  var bannerList = List<BannerListModel>.empty(growable: true).obs;
  var categoryList = List<CategoryListModel>.empty(growable: true).obs;

  getbanner() async {
    isLoading(true);
    bannerList.assignAll(await HomeScreenService().bannerList());
    isLoading(false);
  }

  getcategory() async {
    isLoading(true);
    categoryList.assignAll(await HomeScreenService().categoryList());
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getbanner();
    getcategory();
    super.onInit();
  }
}
