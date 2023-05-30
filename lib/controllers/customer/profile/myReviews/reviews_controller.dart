import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/address_model.dart';
import 'package:elison/models/order_model.dart';
import 'package:elison/models/review_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/models/user_session_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyReviewsController extends GetxController {
  var isLoading = false.obs;

  var reviewsList = List<ReviewModel>.empty(growable: true).obs;

  getReviews() async {
    isLoading(true);
    reviewsList.assignAll(await HomeScreenService().myReviews());
    // isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit

    await getReviews();
    isLoading(false);
    super.onInit();
  }
}
