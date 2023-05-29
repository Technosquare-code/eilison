// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) =>
    List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  String id;
  String adminId;
  String message;
  String files;
  DateTime createdDate;

  ChatModel({
    required this.id,
    required this.adminId,
    required this.message,
    required this.files,
    required this.createdDate,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        adminId: json["admin_id"],
        message: json["message"],
        files: json["files"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "message": message,
        "files": files,
        "created_date": createdDate.toIso8601String(),
      };
}
