import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
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

class MainProductController extends GetxController {
  var isLoading = false.obs;

  var productList = List<ProductsModel>.empty(growable: true).obs;

  getcategory() async {
    isLoading(true);
    productList.assignAll(await HomeScreenService().mainScreenproductList());
    print('product list=============');
    isLoading(false);
  }

  wishlistmanaget(
      {bool? isAdd, ProductsModel? prod, BuildContext? context}) async {
    if (isAdd!) {
      print('is add');
      prod!.isWhishlist = true;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'add', productId: prod.id, recordId: '');
      check
          ? {
              // getcategory(),
              Get.find<HomeScreenController>().getSpecialItem()
            }
          : null;
    } else {
      prod!.isWhishlist = false;
      bool check = await HomeScreenService().manageWishlist(context!,
          action: 'remove', productId: prod.id, recordId: '');
      check
          ? {
              // getcategory(),
              Get.find<HomeScreenController>().getSpecialItem()
            }
          : null;
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

    getcategory();

    super.onInit();
  }
}
