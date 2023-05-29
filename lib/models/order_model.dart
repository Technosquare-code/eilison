// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

List<OrderListModel> orderListModelFromJson(String str) =>
    List<OrderListModel>.from(
        json.decode(str).map((x) => OrderListModel.fromJson(x)));

String orderListModelToJson(List<OrderListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderListModel {
  String id;
  String orderNo;
  String payableAmount;
  String transactionNo;
  DateTime createdDate;
  String itemName;
  String thumbnail;
  String fullName;
  String email;
  String phone;
  String alternateNumber;
  String address;
  String zipCode;
  String city;
  String country;
  String landmark;
  String state;
  String town;
  String status;

  OrderListModel({
    required this.id,
    required this.orderNo,
    required this.payableAmount,
    required this.transactionNo,
    required this.createdDate,
    required this.itemName,
    required this.thumbnail,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.alternateNumber,
    required this.address,
    required this.zipCode,
    required this.city,
    required this.country,
    required this.landmark,
    required this.state,
    required this.town,
    required this.status,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        id: json["id"],
        orderNo: json["order_no"],
        payableAmount: json["payable_amount"],
        transactionNo: json["transaction_no"],
        createdDate: DateTime.parse(json["created_date"]),
        itemName: json["item_name"],
        thumbnail: json["thumbnail"],
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        alternateNumber: json["alternate_number"],
        address: json["address"],
        zipCode: json["zip_code"],
        city: json["city"],
        country: json["country"],
        landmark: json["landmark"],
        state: json["state"],
        town: json["town"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "payable_amount": payableAmount,
        "transaction_no": transactionNo,
        "created_date": createdDate.toIso8601String(),
        "item_name": itemName,
        "thumbnail": thumbnail,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "alternate_number": alternateNumber,
        "address": address,
        "zip_code": zipCode,
        "city": city,
        "country": country,
        "landmark": landmark,
        "state": state,
        "town": town,
      };
}
