import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/customer/products/main_screen_product_controller.dart';
import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/products_model.dart';
import 'package:elison/models/special_item_model.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class DynamicData {
  HomeCategory? category;
  List<ProductsModel>? productList;
  DynamicData({this.category, this.productList});
}

class HomeScreenController extends GetxController {
  var isLoading = false.obs;
  var i = 0.obs;

  final mainscreenController = Get.find<MainScreenController>();
  var bannerList = List<BannerListModel>.empty(growable: true).obs;
  var categoryList = List<CategoryListModel>.empty(growable: true).obs;
  var specialItemList = List<ProductsModel>.empty(growable: true).obs;

  var dynamicItemList = List<DynamicData>.empty(growable: true).obs;
  // var dynamicItemList = List<List<ProductsModel>>.empty(growable: true).obs;

  var subcatId = '0'.obs;

  var lalal = false.obs;
  getbanner() async {
    bannerList.assignAll(await HomeScreenService().bannerList());
  }

  getSpecialItem() async {
    specialItemList.assignAll(await HomeScreenService().specialItemList());

    print('specail item============');
  }

  getcategory() async {
    categoryList.assignAll(await HomeScreenService().categoryList());
  }

  getdynamiccategory() async {
    dynamicItemList.clear();
    for (var element in mainscreenController.homeCategoryList) {
      dynamicItemList.add(DynamicData(
          category: element,
          productList:
              await HomeScreenService().productList('category', element.id)));
      print('object');
    }
    print(
        '------------------------${mainscreenController.homeCategoryList.length}--------------');
    lalal.value = true;
  }

  wishlistmanaget(
      {bool? isAdd, ProductsModel? prod, BuildContext? context}) async {
    if (isAdd!) {
      prod!.isWhishlist = true;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'add', productId: prod.id, recordId: '');
      final mainssproductController = Get.find<MainProductController>();

      check
          ? {
              // getSpecialItem(),
              mainssproductController.getcategory()
            }
          : null;
    } else {
      prod!.isWhishlist = false;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'remove', productId: prod.id, recordId: '');
      check ? getSpecialItem() : null;
    }
  }

  wishlistmanagerfordynamic(
      {bool? isAdd, ProductsModel? prod, BuildContext? context}) async {
    print('adddddddddddddddddd---------$isAdd');
    if (isAdd!) {
      prod!.isWhishlist = true;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'add', productId: prod.id, recordId: '');
      // final mainssproductController = Get.find<MainProductController>();

      // check
      //     ? {
      //         // getSpecialItem(),
      //         // mainssproductController.getcategory()
      //         getdynamiccategory()
      //       }
      //     : null;
    } else {
      prod!.isWhishlist = false;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'remove', productId: prod.id, recordId: '');
      // check ? getdynamiccategory() : null;
    }
  }

  @override
  void onInit() async {
    // TODO: implement onReady
    isLoading(true);
    await getbanner();
    await getcategory();
    await getdynamiccategory();
    // await getNotification();
    await getSpecialItem();

    isLoading(false);
    super.onInit();
  }
}
