import 'package:elison/apiServices/mainscreenService.dart';
import 'package:elison/controllers/customer/products/main_screen_product_controller.dart';
import 'package:elison/controllers/customer/products/product_detail_controller.dart';
import 'package:elison/models/cart_list_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class CartController extends GetxController {
  BuildContext context;
  bool? isadd;
  CartController(this.context, {this.isadd});
  var isLoading = false.obs;
  var addressId = ''.obs;
  var cartList = List<CartListModel>.empty(growable: true).obs;
  final ss = Get.find<MainScreenController>();

  removeProduct(String id, BuildContext context) async {
    isLoading(true);
    bool check = await MainScreenService().removeFromCart(context, cartId: id);

    if (check) {
      print('object000000000000000000');
      await getCartData();
      await ss.getuserdetails(context);

      // Check if the controller is registered
      if (isadd ?? false) {
        print('object');
        Get.find<ProductDetailController>().isAdded(false);
      }
    }

    isLoading(false);
  }

  addMoney(
    BuildContext context, {
    String? totalMoney,
  }) async {
    print('agya child ');
    isLoading(true);
    Get.to(
      UsePaypal(
          sandboxMode: true,
          clientId:
              "AXIVfX83zlT2ojcultE0KkLHltYqrltxGSe-ahXsZnrzOmrgEbr8w71JWJFmoMYLAQrXq0sXU2nMN5qI",
          secretKey:
              "EKe18dZVc2sUP9akgru8yZRxIVlVYP4-GzIu_CPi4rgsRRetGs7aRFQCqJTkjEVvCqFfWFOptxYxQpSi",
          returnURL: "https://samplesite.com/return",
          cancelURL: "https://samplesite.com/cancel",
          transactions: [
            {
              "amount": {
                "total": totalMoney,
                "currency": "USD",
                "details": {
                  "subtotal": totalMoney,
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description": "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": {
                "items": [
                  {
                    "name": "A demo product",
                    "quantity": 1,
                    "price": totalMoney,
                    "currency": "USD"
                  }
                ],
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            // SharedPreferences pref = await SharedPreferences.getInstance();
            print("onSuccess: ${params["paymentId"]}");
            checkout(context, addressId.value, totalMoney, params["paymentId"],
                '1', '');

            isLoading(false);
          },
          onError: (error) {
            print("onError: $error");
            checkout(
              context,
              addressId.value,
              totalMoney,
              error['paymentId'],
              '6',
              error['status'],
            );
            Get.snackbar(
              "Error",
              error['status'],
              backgroundColor: Colors.red,
            );
          },
          onCancel: (params) {
            print('cancelled: $params');
            checkout(
              context,
              addressId.value,
              totalMoney,
              params['paymentId'],
              '6',
              params['status'],
            );
            Get.snackbar(
              "Cancelled",
              params['status'],
              backgroundColor: Colors.red[600],
            );
          }),
    );
  }

  checkout(
    BuildContext context,
    String? addressId,
    String? payamount,
    String? transactionNo,
    String? status,
    String? reason,
  ) async {
    isLoading(true);
    bool check = await MainScreenService().checkoutApi(context,
        address_id: addressId,
        payamount: payamount,
        reason: reason,
        status: status,
        transactionNo: transactionNo);
    if (check) {
      // Get.off('/user-home');
      Get.toNamed('/congracts');
    }
    isLoading(false);
  }

  moveToWishlist(String id, BuildContext context) async {
    isLoading(true);
    bool check = await MainScreenService().moveToWishlist(context, cartId: id);
    check ? {getCartData(), ss.getuserdetails(context)} : null;
    if (isadd ?? false) {
      print('object');
      Get.find<ProductDetailController>().isAdded(false);
    }
    isLoading(false);
  }

  totalMrp() {
    double sum = 0;
    for (CartListModel cart in cartList) {
      sum += double.parse(cart.mrp);
    }
    return sum;
  }

  totalSelling() {
    double sum = 0;
    for (CartListModel cart in cartList) {
      sum += double.parse(cart.sellingPrice);
    }
    return sum;
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
