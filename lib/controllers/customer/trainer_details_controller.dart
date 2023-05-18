import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/address_model.dart';
import 'package:elison/models/order_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TrainerDetailsController extends GetxController {
  String? trainerid;
  TrainerDetailsController({this.trainerid});
  var isLoading = false.obs;
  // final mainscreenController = Get.find<MainScreenController>();

  var userDetails = List<UserDetailsModel>.empty(growable: true).obs;

  getdetails(String trainerId) async {
    isLoading(true);
    userDetails.add(await MainScreenService().trainerdetail(trainerId));
    // isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    // await getAllOrders();
    print('llllllllllllll${trainerid}');
    await getdetails(trainerid!);
    isLoading(false);
    super.onInit();
  }
}
