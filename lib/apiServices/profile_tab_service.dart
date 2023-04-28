import 'dart:convert';

import 'package:elison/models/address_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/support_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/urls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/src/multipart_file.dart' as multipart_file;
import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;

import '../Components/snackbar.dart';

class ProfileTabService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<bool> profileUpdate(BuildContext context,
      {String? name, phone, gender, date}) async {
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
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> changePass(BuildContext context,
      {String? current, newpas}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'current_password': current,
      'new_password': newpas,
    });

    var response = await dio.post(
      '$baseUrl/change-password.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);

    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> manageAddress(BuildContext context,
      {String? name,
      phone,
      email,
      alternateNo,
      address,
      zipcode,
      city,
      town,
      landmark,
      state,
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
      "state": state,
    });

    var response = await dio.post(
      '$baseUrl/manager-address.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== ${form}');
    print(''' 'uid':${pref.read('user_id')},
      'full_name': $name,
      'email': $email,
      'phone': $phone,
      'alternate_number': $alternateNo,
      'address': $address,
      'zip_code':$zipcode,
      'city': $city,
      'landmark': $landmark,
      'town': $town,
      'address_id': $addressId,
      "state": $state,''');
    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> sendSupportmsg(BuildContext context,
      {String? name, phone, email, msg}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'order_no': '',
      'email': email,
      'phone': phone,
      'name': name,
      'message': msg,
    });

    var response = await dio.post(
      '$baseUrl/send-support-message.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== ${form}');

    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> sendWarentyDetails(BuildContext context,
      {String? name,
      phone,
      email,
      productName,
      orderId,
      deliverydate,
      platformName}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'order_no': orderId,
      'email': email,
      'phone': phone,
      'name': name,
      'product_name': productName,
      'delivery_date': deliverydate,
      'platform_name': platformName
    });

    var response = await dio.post(
      '$baseUrl/send-warranty-details.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== ${form}');

    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> profilePictureApi(BuildContext context, {String? image}) async {
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
        // Get.back();

        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> addSessionApi(BuildContext context,
      {String? image,
      String? session_name,
      String? agenda,
      String? start_time,
      String? start_date,
      String? duration,
      String? current_session_photo,
      String? session_type,
      String? description,
      String? zoom_link,
      String? session_id}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'coach_id': pref.read('user_id'),
      'session_name': session_name,
      'agenda': agenda,
      'start_date': start_date,
      'start_time': start_time,
      'duration': duration,
      'session_type': session_type,
      'description': description,
      'zoom_link': zoom_link,
      'session_id': session_id,
      'session_datetime': start_date! + ' ' + start_time!,
      'current_session_photo': current_session_photo,
      "image":
          await multipart_file.MultipartFile.fromFile(image!, filename: image),
    });

    var response = await dio.post(
      '$trainerbaseUrl/create-new-session.php',
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
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> deleteAddress(BuildContext context, {String? addressId}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'address_id': addressId,
    });

    var response = await dio.post(
      '$baseUrl/address-delete.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);

    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<List<AddressModel>> addressList() async {
    List<AddressModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post('$baseUrl/address-list.php',
        options: Options(headers: headers), data: form);
    print(headers);
    print(form);

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(AddressModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<SupportModel>> supportHistryList() async {
    List<SupportModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post('$baseUrl/my-support-history.php',
        options: Options(headers: headers), data: form);
    print(headers);
    print(form);

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(SupportModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }
}
