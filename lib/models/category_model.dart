// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

List<CategoryListModel> categoryListModelFromJson(str) =>
    List<CategoryListModel>.from(
        json.decode(str).map((x) => CategoryListModel.fromJson(x)));

String categoryListModelToJson(List<CategoryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryListModel {
  CategoryListModel({
    required this.id,
    required this.categoryName,
    required this.categoryIcon,
  });

  String id;
  String categoryName;
  String categoryIcon;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
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
