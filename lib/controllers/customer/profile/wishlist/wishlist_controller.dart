import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/special_item_model.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/models/wishList_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistController extends GetxController {
  var isLoading = false.obs;

  var wishList = List<WishlistModel>.empty(growable: true).obs;
  final homecontroller = Get.find<HomeScreenController>();
  getWishlist() async {
    isLoading(true);
    wishList.assignAll(await HomeScreenService().getWishlist());
    isLoading(false);
  }

  wishlistmanager(
      {bool? isAdd, WishlistModel? prod, BuildContext? context}) async {
    if (isAdd!) {
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'add', productId: prod!.productId, recordId: '');
      getWishlist();
      homecontroller.dynamicItemList.clear();
      homecontroller.specialItemList.clear();
      homecontroller.getSpecialItem();

      homecontroller.getdynamiccategory();
      // check
      //     ? {
      //         getWishlist(),
      //         Get.find<HomeScreenController>().getSpecialItem(),
      //         Get.find<HomeScreenController>().getdynamiccategory(),
      //       }
      //     : null;
    } else {
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'remove',
          productId: prod!.productId,
          recordId: prod.recordId);
      // check ?
      getWishlist();
      homecontroller.dynamicItemList.clear();
      homecontroller.specialItemList.clear();
      homecontroller.getSpecialItem();

      homecontroller.getdynamiccategory();
      // : null;

    }
  }
  // getSubcategory(String categoryId) async {
  //   isLoading(true);
  //   subCategoryList
  //       .assignAll(await HomeScreenService().subcategoryList(categoryId));
  //   print('-----------${subCategoryList.length}');
  //   isLoading(false);
  // }

  @override
  void onInit() {
    // TODO: implement onInit

    getWishlist();
    super.onInit();
  }
}
