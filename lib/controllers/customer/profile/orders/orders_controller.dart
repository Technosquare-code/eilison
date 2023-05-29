import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/address_model.dart';
import 'package:elison/models/order_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderListController extends GetxController {
  var isLoading = false.obs;
  // final mainscreenController = Get.find<MainScreenController>();

  var orderList = List<OrderListModel>.empty(growable: true).obs;

  getAllOrders() async {
    isLoading(true);
    orderList.assignAll(await ProfileTabService().orderList());
    // isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getAllOrders();
    isLoading(false);
    super.onInit();
  }
}
