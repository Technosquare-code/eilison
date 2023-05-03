import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../models/support_model.dart';

class SupportController extends GetxController {
  var isLoading = false.obs;
  // final mainscreenController = Get.find<MainScreenController>();

  var supportList = List<SupportModel>.empty(growable: true).obs;

  getAllSupportHistry() async {
    isLoading(true);
    List<SupportModel> dlist = [];
    supportList.assignAll(await ProfileTabService().supportHistryList());
    // supportList.assignAll();
    // supportList.value =
    //     dlist.where((element) => element.orderNo != '').toList();
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllSupportHistry();
    super.onInit();
  }
}
