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
    required this.subcategoryCount,
    required this.categoryIcon,
  });

  String id;
  String categoryName;
  String categoryIcon;
  String subcategoryCount;

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        id: json["id"],
        categoryName: json["category_name"],
        categoryIcon: json["category_icon"],
        subcategoryCount: json['subcategory_count'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_icon": categoryIcon,
      };
}
