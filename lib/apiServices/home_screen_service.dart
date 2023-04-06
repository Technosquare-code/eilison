import 'dart:convert';

import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
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

import '../models/notification_model.dart';

class HomeScreenService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<List<BannerListModel>> bannerList() async {
    List<BannerListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };

    var response = await dio.post(
      '$baseUrl/banner-list.php',
      options: Options(headers: headers),
    );
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        // for (var i in data['data']) {

        // }
        blist.add(BannerListModel.fromJson(response.data));
      }
    }
    return blist;
  }

  Future<List<NotificationModel>> notificationList() async {
    List<NotificationModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'user_type': pref.read('role') == '1' ? 'customer' : 'trainer'
    });

    var response = await dio.post('$baseUrl/my-notifications.php',
        options: Options(headers: headers), data: form);
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint('notification-------------${response.data}');
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(NotificationModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<CategoryListModel>> categoryList() async {
    List<CategoryListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };

    var response = await dio.post(
      '$baseUrl/category-list.php',
      options: Options(headers: headers),
    );
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(CategoryListModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }
}
