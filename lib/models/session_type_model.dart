// To parse this JSON data, do
//
//     final sessionTypeModel = sessionTypeModelFromJson(jsonString);

import 'dart:convert';

List<SessionTypeModel> sessionTypeModelFromJson(String str) =>
    List<SessionTypeModel>.from(
        json.decode(str).map((x) => SessionTypeModel.fromJson(x)));

String sessionTypeModelToJson(List<SessionTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SessionTypeModel {
  String id;
  String categoryName;

  SessionTypeModel({
    required this.id,
    required this.categoryName,
  });

  factory SessionTypeModel.fromJson(Map<String, dynamic> json) =>
      SessionTypeModel(
        id: json["id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
      };
}
