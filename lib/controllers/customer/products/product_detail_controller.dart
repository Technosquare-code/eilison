import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/product_detail_model.dart';
import 'package:elison/models/products_model.dart';
import 'package:elison/models/special_item_model.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductDetailController extends GetxController {
  final String? pro_id;

  ProductDetailController({this.pro_id});

  var isLoading = false.obs;

  var productdetails = List<ProductDetailModel>.empty(growable: true).obs;
  var galleryList = List.empty(growable: true).obs;

  getcategory() async {
    isLoading(true);
    productdetails.assignAll(await HomeScreenService().productdetails(pro_id!));
    galleryList.assignAll(productdetails[0].gallery.split(','));
    isLoading(false);
  }

  addTocart(BuildContext context) async {
    bool check = await HomeScreenService()
        .addToCart(context, productId: productdetails[0].id);
    check ? Get.back() : null;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    getcategory();

    super.onInit();
  }
}
