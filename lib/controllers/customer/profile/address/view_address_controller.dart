import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/address_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ViewAddressController extends GetxController {
  var isLoading = false.obs;
  // final mainscreenController = Get.find<MainScreenController>();

  var addressList = List<AddressModel>.empty(growable: true).obs;

  getAllAddress() async {
    isLoading(true);
    addressList.assignAll(await ProfileTabService().addressList());
    // isLoading(false);
  }

  deleteAdress(String id, BuildContext context) async {
    isLoading(true);
    bool check =
        await ProfileTabService().deleteAddress(context, addressId: id);
    check ? getAllAddress() : null;
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllAddress();
    isLoading(false);
    super.onInit();
  }
}
