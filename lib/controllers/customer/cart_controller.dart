import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/models/cart_list_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var cartList = List<CartListModel>.empty(growable: true).obs;

  removeProduct(String id, BuildContext context) async {
    isLoading(true);
    bool check = await MainScreenService().removeFromCart(context, cartId: id);
    check ? getCartData() : null;
    isLoading(false);
  }

  moveToWishlist(String id, BuildContext context) async {
    isLoading(true);
    bool check = await MainScreenService().moveToWishlist(context, cartId: id);
    check ? getCartData() : null;
    isLoading(false);
  }

  getCartData() async {
    isLoading(true);
    cartList.clear();
    cartList.assignAll(await MainScreenService().cartList());
    isLoading(false);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getCartData();
    super.onReady();
  }
}
