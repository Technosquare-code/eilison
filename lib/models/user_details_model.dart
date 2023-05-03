// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(str) =>
    UserDetailsModel.fromJson(str);

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.userWallet,
    this.profilePicture,
    required this.isProfileDescriptionSkip,
    required this.role,
    required this.gender,
    required this.dob,
    required this.homeCategory,
    required this.totalCartItems,
    required this.bio,
  });

  String id;
  String name;
  String email;
  String bio;
  String phone;
  String userWallet;
  String? profilePicture;
  String isProfileDescriptionSkip;
  String role;
  String gender;
  String dob;
  String totalCartItems;
  List<HomeCategory> homeCategory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        bio: json["bio"],
        email: json["email"],
        phone: json["phone"],
        userWallet: json["user_wallet"],
        profilePicture: json["profile_picture"],
        isProfileDescriptionSkip: json["is_profile_description_skip"],
        role: json["role"],
        gender: json["gender"],
        dob: json["dob"],
        totalCartItems: json["total_cart_items"],
        homeCategory: List<HomeCategory>.from(
            json["home_category"].map((x) => HomeCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "user_wallet": userWallet,
        "profile_picture": profilePicture,
        "is_profile_description_skip": isProfileDescriptionSkip,
        "role": role,
        "gender": gender,
        "dob": dob,
      };
}

class HomeCategory {
  HomeCategory({
    required this.id,
    required this.categoryName,
  });

  String id;
  String categoryName;

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        id: json["id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
      };
}
