// To parse this JSON data, do
//
//     final specialItemModel = specialItemModelFromJson(jsonString);

import 'dart:convert';

List<SpecialItemModel> specialItemModelFromJson(String str) =>
    List<SpecialItemModel>.from(
        json.decode(str).map((x) => SpecialItemModel.fromJson(x)));

String specialItemModelToJson(List<SpecialItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecialItemModel {
  SpecialItemModel({
    required this.id,
    required this.itemName,
    required this.mrp,
    required this.sellingPrice,
    required this.thumbnail,
    required this.isWhishlist,
  });

  String id;
  String itemName;
  String mrp;
  String sellingPrice;
  String thumbnail;
  bool isWhishlist;

  factory SpecialItemModel.fromJson(Map<String, dynamic> json) =>
      SpecialItemModel(
        id: json["id"],
        itemName: json["item_name"],
        mrp: json["mrp"],
        sellingPrice: json["selling_price"],
        thumbnail: json["thumbnail"],
        isWhishlist: json["is_whishlist"] == '0' ? false : true,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_name": itemName,
        "mrp": mrp,
        "selling_price": sellingPrice,
        "thumbnail": thumbnail,
        "is_whishlist": isWhishlist,
      };
}
