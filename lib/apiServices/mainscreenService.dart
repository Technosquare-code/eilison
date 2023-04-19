import 'dart:convert';

import 'package:elison/models/cart_list_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;

import '../Components/snackbar.dart';

class MainScreenService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<UserDetailsModel> userdetail() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final fcmToken = await fcm.getToken();
    debugPrint(fcmToken);
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post(
      '$baseUrl/user-details.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== $form');
    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    return userDetailsModelFromJson(data);
  }

  Future<List<CartListModel>> cartList() async {
    List<CartListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });
    var response = await dio.post('$baseUrl/cart-item-listing.php',
        options: Options(headers: headers), data: form);
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(CartListModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<bool> removeFromCart(
    BuildContext context, {
    String? cartId,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'cart_record_id': cartId,
    });

    var response = await dio.post(
      '$baseUrl/item-remove-from-cart.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);

    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    print(data);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        // snackbar(
        //     context: context,
        //     msg: 'Product removed successfully from card',
        //     title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> moveToWishlist(
    BuildContext context, {
    String? cartId,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'cart_record_id': cartId,
    });

    var response = await dio.post(
      '$baseUrl/item-move-cart-to-wishlist.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);

    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    print(data);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        // snackbar(
        //     context: context,
        //     msg: 'Product removed successfully from card',
        //     title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }
}
