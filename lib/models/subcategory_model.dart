// To parse this JSON data, do
//
//     final subcategoryModel = subcategoryModelFromJson(jsonString);

import 'dart:convert';

List<SubcategoryModel> subcategoryModelFromJson(String str) =>
    List<SubcategoryModel>.from(
        json.decode(str).map((x) => SubcategoryModel.fromJson(x)));

String subcategoryModelToJson(List<SubcategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubcategoryModel {
  SubcategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryIcon,
  });

  String id;
  String categoryName;
  String categoryIcon;

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) =>
      SubcategoryModel(
        id: json["id"],
        categoryName: json["category_name"],
        categoryIcon: json["category_icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_icon": categoryIcon,
      };
}
