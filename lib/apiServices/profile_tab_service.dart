import 'dart:convert';
import 'dart:io';

import 'package:elison/models/address_model.dart';
import 'package:elison/models/chat_model.dart';
import 'package:elison/models/cms_model.dart';
import 'package:elison/models/notification_model.dart';
import 'package:elison/models/order_model.dart';
import 'package:elison/models/post_model.dart';
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
import 'package:intl/intl.dart';

import 'package:http_parser/src/media_type.dart' as mediaType;
import 'package:http_parser/src/media_type.dart' show MediaType;
import '../Components/snackbar.dart';

class ProfileTabService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<bool> profileUpdate(BuildContext context,
      {String? name, phone, gender, date, bio}) async {
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
      'dob': date,
      'bio': bio
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
      {String? name, phone, email, msg, orderID}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'order_no': orderID,
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
      'order_id': orderId,
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
    print('form================== ${form.fields}');
    print("ddddddddddddddddddd${pref.read('user_id')}");
    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        // Get.back();

        // snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> postLike(BuildContext context, {String? post_id}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'post_id': post_id,
    });

    var response = await dio.post(
      '$baseUrl/post-like.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);
    print('form================== ${form.fields}');
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        // print('ikse ander------------');
        // Get.back();
        // snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        // snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> addPostApi(BuildContext context,
      {File? image, bool? isImg, String? description, post_id}) async {
    Map<String, String> headers = {
      'Authorization': pref.read('token'),
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://ourdevelopment.host/eilison/api/manage-post.php'),
    );

    request.headers.addAll(headers);
    request.fields['uid'] = pref.read('user_id').toString();
    request.fields['post_id'] = post_id;
    request.fields['post_content'] = description ?? '';
    request.fields['old_media_content'] = '';
    request.fields['post_hashtags'] = '#imageTest #TestPost';
    if (image != null) {
      if (isImg!) {
        request.files.add(await http.MultipartFile.fromPath(
          'post_media',
          image.path,
          contentType: MediaType('image', 'jpg'),
        ));
      } else {
        request.files.add(await http.MultipartFile.fromPath(
          'post_media',
          image.path,
          contentType: MediaType('video', 'mp4'),
        ));
      }
    } else {
      request.fields['post_media'] = '';
    }
    // if (isImg!) {
    //   if (image != null) {
    //     request.files.add(await http.MultipartFile.fromPath(
    //       'post_media',
    //       image.path,
    //       contentType: MediaType('image', 'jpg'),
    //     ));
    //   }
    // } else {
    //   if (image != null) {
    //     request.files.add(await http.MultipartFile.fromPath(
    //       'post_media',
    //       image.path,
    //       contentType: MediaType('video', 'mp4'),
    //     ));
    //   }
    // }

    var response = await request.send();

    if (response.statusCode == 200) {
      // Request successful
      var responseData = await response.stream.bytesToString();
      // Handle the response data
      print(responseData);
      var parsedResponse = jsonDecode(responseData);
      if (parsedResponse['status'] == 'true') {
        Get.back();

        snackbar(
            context: context, msg: parsedResponse['data'], title: 'Success');

        return true;
      } else {
        snackbar(
            context: context, msg: parsedResponse['data'], title: 'Failed');

        return false;
      }
      return true;
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
      return false;
    }
  }
  // Future<bool> addPostApi(BuildContext context,
  //     {String? media, post_id, post_content, old_media_content}) async {
  //   Dio dio = Dio();
  //   formData.FormData form;
  //   var headers = {
  //     'Authorization': pref.read('token'),
  //   };
  //   form = formData.FormData.fromMap({
  //     'uid': pref.read('user_id'),
  //     'old_media_content': old_media_content,
  //     'post_id': post_id,
  //     'post_content': post_content,
  //     "post_media":
  //         await multipart_file.MultipartFile.fromFile(media!, filename: media),
  //     'post_hashtags': '#imageTest #TestPost'
  //   });
  //   print('form================== ${form.fields}');

  //   var response = await dio.post(
  //     'https://ourdevelopment.host/eilison/api/manage-post.php',
  //     data: form,
  //     options: Options(headers: headers),
  //   );
  //   print(headers);
  //   print('form================== $form');

  //   print(form.fields);
  //   var data = response.data;
  //   print(data);
  //   debugPrint(data['status']);
  //   if (response.statusCode == 200) {
  //     if (data['status'] == 'true') {
  //       Get.back();

  //       snackbar(context: context, msg: data['data'], title: 'Success');

  //       return true;
  //     } else {
  //       snackbar(context: context, msg: data['data'], title: 'Failed');

  //       return false;
  //     }
  //   }
  //   return false;
  // }

  Future<List<ChatModel>> getChat() async {
    List<ChatModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post('$baseUrl/chat-history.php',
        data: form, options: Options(headers: headers));
    var data = response.data;
    print(response.data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(ChatModel.fromJson(i));
          print('object');
        }
      }
    }
    return blist;
  }

  Future<ChatModel> sendChat(BuildContext context, String text,
      {File? media}) async {
    ChatModel? chat;
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = media != null
        ? formData.FormData.fromMap({
            'uid': pref.read('user_id') ?? '1',
            'message_text': text,
            'imgupload': await multipart_file.MultipartFile.fromFile(media.path,
                filename: media.path),
          })
        : formData.FormData.fromMap({
            'uid': pref.read('user_id') ?? '1',
            'message_text': text,
            'imgupload': '',
          });
    var response = await dio.post('$baseUrl/chat.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        chat = ChatModel(
            id: response.data['data']['id'],
            adminId: response.data['data']['admin_id'],
            message: response.data['data']['message'],
            files: response.data['data']['files'],
            createdDate: DateTime.parse(response.data['data']['created_date']));
        // Get.back();
        // debugPrint(data);
        // snackbar(context: context, msg: data['data'], title: 'Success');
        return chat;
      }
      // Get.back();
      // snackbar(context: context, msg: data['data'], title: 'Failed');
    }
    return chat!;
  }

  Future<bool> timelinePictureApi(BuildContext context, {String? image}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'old_timeline_picture': '',
      "image":
          await multipart_file.MultipartFile.fromFile(image!, filename: image),
    });

    var response = await dio.post(
      '$trainerbaseUrl/timeline-photo-update.php',
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

        // snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> deletePostApi(BuildContext context, {String? postId}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'post_id': postId,
    });
    print(form.fields);
    print(headers);
    var response = await dio.post(
      '$baseUrl/delete-post.php',
      data: form,
      options: Options(headers: headers),
    );

    print('form================== ${form.fields}');
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        // Get.back();

        // snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> deleteSessionApi(BuildContext context,
      {String? sessionId}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'session_id': sessionId,
    });
    print(form.fields);
    print(headers);
    var response = await dio.post(
      '$trainerbaseUrl/session-delete.php',
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

  Future<bool> addSessionApi(BuildContext context,
      {String? image,
      String? imgpath,
      String? session_name,
      String? agenda,
      String? start_time,
      String? start_date,
      String? duration,
      String? session_type,
      String? description,
      String? zoom_link,
      String? session_id}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    String dateStr = start_date!;
    print(dateStr);
    DateTime date = DateFormat("dd/MM/yyyy").parse(dateStr);
    String formattedDate = DateFormat("yyyy-MM-dd").format(date);
    String timeStr = start_time!;
    print(timeStr);
    DateTime time = DateFormat("HH:mm").parse(timeStr);
    DateTime endtime = DateFormat("HH:mm")
        .parse(timeStr)
        .add(Duration(minutes: int.parse(duration ?? '0')));
    String formattedTime = DateFormat("HH:mm:ss").format(time);
    String formattedEndTime = DateFormat("HH:mm:ss").format(endtime);
    String amPmTime = DateFormat("h:mm a").format(time);
    // String endamPmTime = DateFormat("h:mm a").format(time);
    print(image);
    form = image != ''
        ? formData.FormData.fromMap({
            'coach_id': pref.read('user_id'),
            'session_name': session_name,
            'agenda': agenda,
            'start_date': formattedDate,
            'start_time': amPmTime,
            'duration': duration,
            'session_type': session_type,
            'description': description,
            'zoom_link': zoom_link,
            'session_id': session_id,
            'session_datetime': formattedDate + ' ' + formattedTime,
            'session_end_datetime': formattedDate + ' ' + formattedEndTime,
            'current_session_photo': '',
            "image": await multipart_file.MultipartFile.fromFile(image!,
                filename: image),
          })
        : formData.FormData.fromMap({
            'coach_id': pref.read('user_id'),
            'session_name': session_name,
            'agenda': agenda,
            'start_date': formattedDate,
            'start_time': amPmTime,
            'duration': duration,
            'session_type': session_type,
            'description': description,
            'zoom_link': zoom_link,
            'session_id': session_id,
            'session_datetime': formattedDate + ' ' + formattedTime,
            'session_end_datetime': formattedDate + ' ' + formattedEndTime,
            'current_session_photo': imgpath,
            "image": '',
          });
    print(form.fields);
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
        // snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<List<PostListModel>> postsList() async {
    List<PostListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post('$baseUrl/posts-list.php',
        data: form, options: Options(headers: headers));
    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(PostListModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<PostListModel>> mypostsList() async {
    List<PostListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post('$baseUrl/my-posts-list.php',
        data: form, options: Options(headers: headers));
    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(PostListModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
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

  Future<List<OrderListModel>> orderList() async {
    List<OrderListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
    });

    var response = await dio.post('$baseUrl/my-order-list.php',
        options: Options(headers: headers), data: form);

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(OrderListModel.fromJson(i));
          print('object');
        }
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

  Future<List<CmsModel>> customerCms() async {
    List<CmsModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    var response =
        await dio.post('$baseUrl/cms.php', options: Options(headers: headers));

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      // if (data['status'] == 'true') {
      //   for (var i in data['data']) {
      //     blist.add(CmsModel.fromJson(i));
      //     print('object');
      //   }
      blist.add(CmsModel.fromJson(response.data));
      // blist.assignAll(categoryListModelFromJson(data));

    }
    return blist;
  }

  Future<List<CmsModel>> coachCms() async {
    List<CmsModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    var response = await dio.post('$trainerbaseUrl/cms.php',
        options: Options(headers: headers));

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      // if (data['status'] == 'true') {
      //   for (var i in data['data']) {
      //     blist.add(CmsModel.fromJson(i));
      //     print('object');
      //   }
      blist.add(CmsModel.fromJson(response.data));
      // blist.assignAll(categoryListModelFromJson(data));

    }
    return blist;
  }
}
