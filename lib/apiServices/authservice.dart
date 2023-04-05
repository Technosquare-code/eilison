import 'dart:convert';

import 'package:elison/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;

class AuthService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<bool> registerApi(
      {String? name, email, password, usertype, phoneno}) async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final fcmToken = await fcm.getToken();
    debugPrint(fcmToken);
    Dio dio = Dio();
    formData.FormData form;

    form = formData.FormData.fromMap({
      // 'token': token,
      'fcm_token': fcmToken,
      'phone': phoneno,
      'name': name,
      'email': email,
      'password': password,
      'user_type': usertype
    });

    var response = await dio.post(
      '$baseUrl/signup.php',
      data: form,
    );

    print("ddddddddddddddddddd$response");
    print(form.fields);
    if (response.statusCode == 200) {
      var data = response.data;
      debugPrint(data['status']);
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      }

      Fluttertoast.showToast(msg: data['data']);

      return false;
    } else {
      Fluttertoast.showToast(msg: 'Register Failed');

      return false;
    }
  }

  Future<bool> loginApi({String? email, password}) async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final fcmToken = await fcm.getToken();
    debugPrint(fcmToken);
    Dio dio = Dio();
    formData.FormData form;

    form = formData.FormData.fromMap({
      // 'token': token,
      'fcm_token': fcmToken,

      'email': email,
      'password': password,
    });

    var response = await dio.post(
      '$baseUrl/login.php',
      data: form,
    );

    print("login details-------------$response");
    print(form.fields);
    if (response.statusCode == 200) {
      var data = response.data;
      debugPrint(data['status']);
      if (data['status'] == 'true') {
        pref.write('isLogin', true);
        pref.write('user_id', data['data']['id']);
        pref.write('role', data['data']['role']);
        pref.write('token', data['data']['token']);
        // Fluttertoast.showToast(msg: data['data']);
        return true;
      }

      Fluttertoast.showToast(msg: data['data']);

      return false;
    } else {
      Fluttertoast.showToast(msg: 'Something Went SWrong');

      return false;
    }
  }

  Future<bool> forgotpassApi({String? email}) async {
    Dio dio = Dio();
    formData.FormData form;

    form = formData.FormData.fromMap({
      'email': email,
    });

    var response = await dio.post(
      '$baseUrl/forgot-password.php',
      data: form,
    );

    print("ddddddddddddddddddd$response");
    print(form.fields);
    if (response.statusCode == 200) {
      var data = response.data;
      debugPrint(data['status']);
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      }

      Fluttertoast.showToast(msg: data['data']);

      return false;
    } else {
      Fluttertoast.showToast(msg: 'Something Went SWrong');

      return false;
    }
  }
}
