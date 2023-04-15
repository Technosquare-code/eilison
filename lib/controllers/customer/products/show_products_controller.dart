import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
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

class ShowProductController extends GetxController {
  final String? type;
  final String? cat_id;

  ShowProductController({this.cat_id, this.type});
  var isLoading = false.obs;

  var productList = List<ProductsModel>.empty(growable: true).obs;

  getcategory() async {
    isLoading(true);
    productList
        .assignAll(await HomeScreenService().productList(type!, cat_id!));
    isLoading(false);
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
