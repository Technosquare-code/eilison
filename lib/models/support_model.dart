// To parse this JSON data, do
//
//     final supportModel = supportModelFromJson(jsonString);

import 'dart:convert';

List<SupportModel> supportModelFromJson(String str) => List<SupportModel>.from(
    json.decode(str).map((x) => SupportModel.fromJson(x)));

String supportModelToJson(List<SupportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupportModel {
  SupportModel({
    required this.id,
    required this.uid,
    required this.orderNo,
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    required this.token,
    required this.status,
    required this.createdDate,
    required this.closeDate,
  });

  String id;
  String uid;
  String orderNo;
  String name;
  String email;
  String phone;
  String message;
  String token;
  String status;
  DateTime createdDate;
  String closeDate;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        id: json["id"],
        uid: json["uid"],
        orderNo: json["order_no"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        message: json["message"],
        token: json["token"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        closeDate: json["close_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "order_no": orderNo,
        "name": name,
        "email": email,
        "phone": phone,
        "message": message,
        "token": token,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "close_date": closeDate,
      };
}
