// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

List<CartListModel> cartListModelFromJson(String str) =>
    List<CartListModel>.from(
        json.decode(str).map((x) => CartListModel.fromJson(x)));

String cartListModelToJson(List<CartListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartListModel {
  CartListModel({
    required this.cartRecordId,
    required this.id,
    required this.itemName,
    required this.mrp,
    required this.sellingPrice,
    required this.thumbnail,
    required this.quantity,
  });

  String cartRecordId;
  String id;
  String itemName;
  String mrp;
  String sellingPrice;
  String thumbnail;
  String quantity;

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        cartRecordId: json["cart_record_id"],
        id: json["id"],
        itemName: json["item_name"],
        mrp: json["mrp"],
        sellingPrice: json["selling_price"],
        thumbnail: json["thumbnail"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "cart_record_id": cartRecordId,
        "id": id,
        "item_name": itemName,
        "mrp": mrp,
        "selling_price": sellingPrice,
        "thumbnail": thumbnail,
        "quantity": quantity,
      };
}
