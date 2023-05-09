import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/controllers/customer/profile/address/view_address_controller.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../mainscreen_controller.dart';

class AddAddressController extends GetxController {
  final bool? isAdd;
  final int? index;
  AddAddressController({this.isAdd, this.index});
  var isLoading = false.obs;
  // var isAdd = Get.arguments;
  final mainscreenController = Get.find<MainScreenController>();

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
  final addresscontroller = Get.find<ViewAddressController>();

  filldata() {
    address.text = addresscontroller.addressList[index!].address;
    city.text = addresscontroller.addressList[index!].city;
    name.text = addresscontroller.addressList[index!].fullName;
    alternateNo.text = addresscontroller.addressList[index!].alternateNumber;
    email.text = addresscontroller.addressList[index!].email;
    landmark.text = addresscontroller.addressList[index!].landmark;
    locality.text = addresscontroller.addressList[index!].town;
    phoneNo.text = addresscontroller.addressList[index!].phone;
    pincode.text = addresscontroller.addressList[index!].zipCode;
    state.text = addresscontroller.addressList[index!].state;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    name.text = mainscreenController.userdetailList[0].data.name;
    email.text = mainscreenController.userdetailList[0].data.email;
    phoneNo.text = mainscreenController.userdetailList[0].data.phone;
    if (!isAdd!) {
      print('--------------------------------------$index');
      filldata();
      // yha pe address list ka data textcontrollers m dalenge
    }
    super.onInit();
  }

  addEditAddress(BuildContext context) async {
    isLoading(true);
    String addressId = isAdd! ? '' : addresscontroller.addressList[index!].id;
    bool check = await ProfileTabService().manageAddress(
      context,
      address: address.text,
      addressId: addressId,
      alternateNo: alternateNo.text,
      city: city.text,
      email: email.text,
      landmark: landmark.text,
      name: name.text,
      phone: phoneNo.text,
      town: locality.text,
      zipcode: pincode.text,
      state: state.text,
    );

    if (check) {
      isLoading(false);
      addresscontroller.getAllAddress();
      addresscontroller.isLoading(false);
      Get.back();
    }
    isLoading(false);
  }
}
