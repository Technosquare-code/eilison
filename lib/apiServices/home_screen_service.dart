import 'dart:convert';
import 'dart:io';

import 'package:elison/models/banner_model.dart';
import 'package:elison/models/category_model.dart';
import 'package:elison/models/product_detail_model.dart';
import 'package:elison/models/products_model.dart';
import 'package:elison/models/review_model.dart';
import 'package:elison/models/session_list_model.dart';
import 'package:elison/models/session_type_model.dart';
import 'package:elison/models/special_item_model.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/models/user_details_model.dart';
import 'package:elison/models/user_session_model.dart';
import 'package:elison/models/video_model.dart';
import 'package:elison/models/wishList_model.dart';
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

  Future<List<ReviewModel>> myReviews() async {
    List<ReviewModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
    });
    var response = await dio.post('$baseUrl/my-review.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var element in data['data']) {
          blist.add(ReviewModel.fromJson(element));
        }
      }
    }
    return blist;
  }

  Future<List<UserSessionModel>> completedSessionList() async {
    List<UserSessionModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
    });
    var response = await dio.post('$baseUrl/completed-session-list.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var element in data['data']) {
          blist.add(UserSessionModel.fromJson(element));
        }
      }
    }
    return blist;
  }

  Future<List<UserSessionModel>> ongoingMySessionList() async {
    List<UserSessionModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
    });
    var response = await dio.post('$baseUrl/ongoing-session-list.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var element in data['data']) {
          blist.add(UserSessionModel.fromJson(element));
        }
      }
    }
    return blist;
  }

  Future<List<UserSessionModel>> onlineSessionList(String type) async {
    List<UserSessionModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'type': type,
    });
    var response = await dio.post('$baseUrl/session-list.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var element in data['data']) {
          blist.add(UserSessionModel.fromJson(element));
        }
      }
    }
    return blist;
  }

  Future<List<UserSessionModel>> enrollSessionList(String type) async {
    List<UserSessionModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'type': type,
    });
    var response = await dio.post('$baseUrl/enrolled-session-list.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var element in data['data']) {
          blist.add(UserSessionModel.fromJson(element));
        }
      }
    }
    return blist;
  }

  Future<bool> enrollSession(BuildContext context, String sessionId) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
      'session_id': sessionId,
    });
    var response = await dio.post('$baseUrl/enroll-session.php',
        options: Options(headers: headers), data: form);
    print(response.data);

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');
        return true;
      }
      // Get.back();
      snackbar(context: context, msg: data['data'], title: 'Failed');
    }
    return false;
  }

  Future<List<SessionTypeModel>> sessionTypeList() async {
    List<SessionTypeModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };

    var response = await dio.post(
      '$trainerbaseUrl/session-category.php',
      options: Options(headers: headers),
    );
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(SessionTypeModel.fromJson(i));
        }
      }
    }
    return blist;
  }

  Future<List<VideoModel>> videoListApi() async {
    List<VideoModel> blist = [];
    Dio dio = Dio();

    var response = await dio.post(
      '$baseUrl/our-videos.php',
    );

    var data = response.data;

    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(VideoModel.fromJson(i));
        }
      }
    }
    return blist;
  }

  Future<List<SessionListModel>> homeSessionList() async {
    List<SessionListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'coach_id': pref.read('user_id') ?? '1',
    });
    var response = await dio.post('$trainerbaseUrl/scheduled-session-list.php',
        options: Options(headers: headers), data: form);
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(SessionListModel.fromJson(i));
        }
      }
    }
    return blist;
  }

  Future<List<SessionListModel>> ongoingSessionList() async {
    List<SessionListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'coach_id': pref.read('user_id') ?? '1',
    });
    var response = await dio.post('$trainerbaseUrl/ongoing-session-list.php',
        options: Options(headers: headers), data: form);
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(SessionListModel.fromJson(i));
        }
      }
    }
    return blist;
  }

  Future<List<SessionListModel>> homePastSessionList() async {
    List<SessionListModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'coach_id': pref.read('user_id') ?? '1',
    });
    var response = await dio.post('$trainerbaseUrl/past-session-list.php',
        options: Options(headers: headers), data: form);
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(SessionListModel.fromJson(i));
        }
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

  Future<bool> manageWishlist(BuildContext context,
      {String? recordId, productId, action}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'record_id': recordId,
      'product_id': productId,
      'action': action
    });
    print('wishlist api----------${form.fields}');
    var response = await dio.post(
      '$baseUrl/manage-wishlist.php',
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
        // snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<bool> addToCart(
    BuildContext context, {
    String? productId,
  }) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'pid': productId,
    });

    var response = await dio.post(
      '$baseUrl/add-to-cart.php',
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
        // snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        snackbar(context: context, msg: data['data'], title: 'Failed');

        return false;
      }
    }
    return false;
  }

  Future<List<ProductDetailModel>> productdetails(String pro_id) async {
    List<ProductDetailModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'product_id': pro_id,
      'uid': pref.read('user_id') ?? '1',
    });
    print(headers);
    print(form.fields);
    var response = await dio.post(
      '$baseUrl/product-details.php',
      options: Options(headers: headers),
      data: form,
    );

    var data = response.data;
    debugPrint(response.statusMessage);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in [data['data']]) {
          blist.add(ProductDetailModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<ProductsModel>> productList(String type, String catid) async {
    List<ProductsModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'type': type,
      'cat_id': catid,
      'uid': pref.read('user_id') ?? '1',
    });
    var response = await dio.post(
      '$baseUrl/product-listing-according-categories.php',
      options: Options(headers: headers),
      data: form,
    );
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(ProductsModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<ProductsModel>> mainScreenproductList() async {
    List<ProductsModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
    });
    var response = await dio.post(
      '$baseUrl/product-listing.php',
      options: Options(headers: headers),
      data: form,
    );
    print(headers);

    print("ddddddddddddddddddd${pref.read('user_id')}");

    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(ProductsModel.fromJson(i));
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<SubcategoryModel>> subcategoryList(String cate_id) async {
    List<SubcategoryModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'category_id': cate_id,
    });

    var response = await dio.post('$baseUrl/subcategory-list.php',
        options: Options(headers: headers), data: form);
    print(headers);
    print(form);

    print("ddddddddddddddddddd$cate_id");

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(SubcategoryModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<ProductsModel>> specialItemList() async {
    List<ProductsModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      "type": 'view_all',
      'uid': pref.read('user_id') ?? '1',
    });

    var response = await dio.post('$baseUrl/special-deal-item-listing.php',
        options: Options(headers: headers), data: form);
    print(headers);
    print(form);

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(ProductsModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }

  Future<List<WishlistModel>> getWishlist() async {
    List<WishlistModel> blist = [];
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id') ?? '1',
    });

    var response = await dio.post('$baseUrl/my-wishlist.php',
        options: Options(headers: headers), data: form);
    print(headers);
    print(form);

    var data = response.data;
    print(data);
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        for (var i in data['data']) {
          blist.add(WishlistModel.fromJson(i));
          print('object');
        }
        // blist.assignAll(categoryListModelFromJson(data));
      }
    }
    return blist;
  }
}
