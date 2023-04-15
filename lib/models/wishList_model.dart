// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

List<WishlistModel> wishlistModelFromJson(String str) =>
    List<WishlistModel>.from(
        json.decode(str).map((x) => WishlistModel.fromJson(x)));

String wishlistModelToJson(List<WishlistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishlistModel {
  WishlistModel({
    required this.recordId,
    required this.uid,
    required this.productId,
    required this.itemName,
    required this.thumbnail,
    required this.sellingPrice,
  });

  String recordId;
  String uid;
  String productId;
  String itemName;
  String thumbnail;
  String sellingPrice;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        recordId: json["record_id"],
        uid: json["uid"],
        productId: json["product_id"],
        itemName: json["item_name"],
        thumbnail: json["thumbnail"],
        sellingPrice: json["selling_price"],
      );

  Map<String, dynamic> toJson() => {
        "record_id": recordId,
        "uid": uid,
        "product_id": productId,
        "item_name": itemName,
        "thumbnail": thumbnail,
        "selling_price": sellingPrice,
      };
}
