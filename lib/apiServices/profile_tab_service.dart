import 'dart:convert';

import 'package:elison/models/notification_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/src/multipart_file.dart' as multipart_file;
import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;

class ProfileTabService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<bool> profileUpdate({String? name, phone, gender, date}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'name': name,
      'phone': phone,
      'gender': gender,
      'dob': date
    });

    var response = await dio.post(
      '$baseUrl/profile-update.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== $form');
    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      } else {
        Fluttertoast.showToast(msg: data['data']);
        return false;
      }
    }
    return false;
  }

  Future<bool> manageAddress(
      {String? name,
      phone,
      email,
      alternateNo,
      address,
      zipcode,
      city,
      town,
      landmark,
      addressId}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'full_name': name,
      'email': email,
      'phone': phone,
      'alternate_number': alternateNo,
      'address': address,
      'zip_code': zipcode,
      'city': city,
      'landmark': landmark,
      'town': town,
      'address_id': addressId,
    });

    var response = await dio.post(
      '$baseUrl/manager-address.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== $form');
    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      } else {
        Fluttertoast.showToast(msg: data['data']);
        return false;
      }
    }
    return false;
  }

  Future<bool> profilePictureApi({String? image}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'old_profile_picture': '',
      "image":
          await multipart_file.MultipartFile.fromFile(image!, filename: image),
    });

    var response = await dio.post(
      '$baseUrl/profile-picture-update.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== $form');
    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Fluttertoast.showToast(msg: data['data']);
        return true;
      } else {
        Fluttertoast.showToast(msg: data['data']);
        return false;
      }
    }
    return false;
  }
}
