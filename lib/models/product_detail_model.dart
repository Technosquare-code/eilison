// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

List<ProductDetailModel> productDetailModelFromJson(String str) =>
    List<ProductDetailModel>.from(
        json.decode(str).map((x) => ProductDetailModel.fromJson(x)));

String productDetailModelToJson(List<ProductDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDetailModel {
  ProductDetailModel({
    required this.id,
    required this.categoryId,
    required this.category,
    required this.subcategory,
    required this.itemName,
    required this.stock,
    required this.remainingStock,
    required this.mrp,
    required this.sellingPrice,
    required this.sku,
    required this.thumbnail,
    required this.gallery,
    required this.description,
    required this.itemManual,
    required this.videoUrl,
    required this.isFeatured,
    required this.status,
    required this.createdDate,
    required this.isWhishlist,
    required this.isCartAdded,
  });

  String id;
  String categoryId;
  String category;
  String subcategory;
  String itemName;
  String stock;
  String remainingStock;
  String mrp;
  String sellingPrice;
  String sku;
  String thumbnail;
  String gallery;
  String description;
  String itemManual;
  String videoUrl;
  String isFeatured;
  String status;
  DateTime createdDate;
  bool isWhishlist;
  bool isCartAdded;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        category: json["cat_name"],
        categoryId: json["category"],
        subcategory: json["subcategory"],
        itemName: json["item_name"],
        stock: json["stock"],
        remainingStock: json["remaining_stock"],
        mrp: json["mrp"],
        sellingPrice: json["selling_price"],
        sku: json["sku"],
        thumbnail: json["thumbnail"],
        gallery: json["gallery"],
        description: json["description"],
        itemManual: json["item_manual"],
        videoUrl: json["video_url"],
        isFeatured: json["is_featured"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        isWhishlist: json["is_whishlist"] == '1' ? true : false,
        isCartAdded: json['is_added_cart'] == '1' ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "subcategory": subcategory,
        "item_name": itemName,
        "stock": stock,
        "remaining_stock": remainingStock,
        "mrp": mrp,
        "selling_price": sellingPrice,
        "sku": sku,
        "thumbnail": thumbnail,
        "gallery": gallery,
        "description": description,
        "item_manual": itemManual,
        "video_url": videoUrl,
        "is_featured": isFeatured,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "is_whishlist": isWhishlist,
      };
}
