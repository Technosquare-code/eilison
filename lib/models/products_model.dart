// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
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

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        itemName: json["item_name"],
        mrp: json["mrp"],
        sellingPrice: json["selling_price"],
        thumbnail: json["thumbnail"],
        isWhishlist: json["is_whishlist"] == '1' ? true : false,
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
