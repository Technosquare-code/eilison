import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddAddressController extends GetxController {
  final bool isAdd;
  AddAddressController(this.isAdd);
  var isLoading = false.obs;
  // var isAdd = Get.arguments;
  // final mainscreenController = Get.find<MainScreenController>();

  final name = TextEditingController();
  final alternateNo = TextEditingController();
  final email = TextEditingController();
  final pincode = TextEditingController();
  final address = TextEditingController();
  final landmark = TextEditingController();
  final locality = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final phoneNo = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    if (!isAdd) {
      // yha pe address list ka data textcontrollers m dalenge
    }
    super.onInit();
  }

  addEditAddress(String? addressId) async {
    isLoading(true);
    bool check = await ProfileTabService().manageAddress(
        address: address.text,
        addressId: isAdd ? addressId : '',
        alternateNo: alternateNo.text,
        city: city.text,
        email: email.text,
        landmark: landmark.text,
        name: name.text,
        phone: phoneNo.text,
        town: locality.text,
        zipcode: pincode.text);
    if (check) {
      isLoading(false);
    }
  }
}
