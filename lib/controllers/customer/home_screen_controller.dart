import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/customer/products/main_screen_product_controller.dart';
import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/special_item_model.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class HomeScreenController extends GetxController {
  var isLoading = false.obs;
  final mainscreenController = Get.find<MainScreenController>();
  var bannerList = List<BannerListModel>.empty(growable: true).obs;
  var notificationList = List<NotificationModel>.empty(growable: true).obs;
  var categoryList = List<CategoryListModel>.empty(growable: true).obs;
  var specialItemList = List<SpecialItemModel>.empty(growable: true).obs;
  // var subCategoryList = List<SubcategoryModel>.empty(growable: true).obs;
  var subcatId = '0'.obs;
  // var parentSubCategoryList =
  //     List<List<SubcategoryModel>>.empty(growable: true).obs;

  getbanner() async {
    isLoading(true);
    bannerList.assignAll(await HomeScreenService().bannerList());
    isLoading(false);
  }

  getSpecialItem() async {
    isLoading(true);
    specialItemList.assignAll(await HomeScreenService().specialItemList());
    isLoading(false);
    print('specail item============');
  }

  getNotification() async {
    isLoading(true);
    notificationList.assignAll(await HomeScreenService().notificationList());
    isLoading(false);
  }

  getcategory() async {
    isLoading(true);
    categoryList.assignAll(await HomeScreenService().categoryList());
    isLoading(false);
  }

  wishlistmanaget(
      {bool? isAdd, SpecialItemModel? prod, BuildContext? context}) async {
    if (isAdd!) {
      prod!.isWhishlist = true;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'add', productId: prod.id, recordId: '');
      final mainssproductController = Get.find<MainProductController>();

      check ? {getSpecialItem(), mainssproductController.getcategory()} : null;
    } else {
      prod!.isWhishlist = false;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'remove', productId: prod.id, recordId: '');
      check ? getSpecialItem() : null;
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
    getbanner();
    getcategory();
    getNotification();
    getSpecialItem();
    super.onInit();
  }
}
