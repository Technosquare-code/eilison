import 'dart:convert';

import 'package:elison/models/cart_list_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/rating_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  Future userdetail(BuildContext context) async {
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
    if (data['status'] != 'true') {
      print('get user detail false ara h');
      pref.write('isLogin', false);
      Get.offAllNamed('/login-screen', arguments: [context]);
      return;
    }
    return userDetailsModelFromJson(data);
  }

  Future trainerdetail(String trainerId) async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final fcmToken = await fcm.getToken();
    debugPrint(fcmToken);
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': trainerId,
    });

    var response = await dio.post(
      '$baseUrl/user-details.php',
      data: form,
      options: Options(headers: headers),
    );

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (data['status'] != 'true') {
      return;
    }
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

  Future<List<RatingListModel>> ratingList(String trainerId) async {
    List<RatingListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'coach_id': trainerId,
    });
    var response = await dio.post('$trainerbaseUrl/rating-list.php',
        options: Options(headers: headers), data: form);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(RatingListModel.fromJson(i));
        }
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

  Future<bool> checkoutApi(
    BuildContext context, {
    String? address_id,
    String? payamount,
    String? transactionNo,
    String? status,
    String? reason,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'address_id': address_id,
      'payable_amount': payamount,
      'transaction_no': transactionNo,
      'status': status,
      'reason': reason
    });

    var response = await dio.post(
      '$baseUrl/checkout.php',
      data: form,
      options: Options(headers: headers),
    );

    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    print(data);
    print('checkout api hit hori h----------');
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

  Future<bool> startSessionApi(
    BuildContext context, {
    String? session_id,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'session_id': session_id,
    });

    var response = await dio.post(
      '$trainerbaseUrl/start-session.php',
      data: form,
      options: Options(headers: headers),
    );

    print(form.fields);
    var data = response.data;

    print(data);
    print('start-session api hit hori h----------');
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> rateSessionApi(BuildContext context,
      {String? session_id, rating, review, coachId}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'session_id': session_id,
      'rating': rating,
      'review': review,
      'coach_id': coachId
    });

    var response = await dio.post(
      '$baseUrl/add-rating.php',
      data: form,
      options: Options(headers: headers),
    );

    print(form.fields);
    var data = response.data;

    print(data);
    print('rate-session api hit hori h----------');
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        Fluttertoast.showToast(msg: data['data']);
        return true;
      } else {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> joinSessionApi(
    BuildContext context, {
    String? session_id,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'session_id': session_id,
    });

    var response = await dio.post(
      '$baseUrl/join-enrolled-session.php',
      data: form,
      options: Options(headers: headers),
    );

    print(form.fields);
    var data = response.data;

    print(data);
    print('join-session api hit hori h----------');
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> endSessionApi(
    BuildContext context, {
    String? session_id,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'session_id': session_id,
    });

    var response = await dio.post(
      '$trainerbaseUrl/complete-session.php',
      data: form,
      options: Options(headers: headers),
    );

    print(form.fields);
    var data = response.data;

    print(data);
    print('end-session api hit hori h----------');
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
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
        // Fluttertoast.showToast(msg: data['data']);
        // snackbar(
        //     context: context,
        //     msg: 'Product removed successfully from card',
        //     title: 'Success');

        return true;
      } else {
        Get.snackbar('Failed', data['data'] ?? '',
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            isDismissible: true,
            margin: EdgeInsets.only(bottom: 50),
            maxWidth: 300);
        // snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }
}
