// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(
    json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  String id;
  String commentId;
  String comment;
  DateTime createdDate;
  String name;
  String profilePicture;
  List<CommentModel>? reply;

  CommentModel({
    required this.id,
    required this.commentId,
    required this.comment,
    required this.createdDate,
    required this.name,
    required this.profilePicture,
    this.reply,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        commentId: json["comment_id"],
        comment: json["comment"],
        createdDate: DateTime.parse(json["created_date"]),
        name: json["name"],
        profilePicture: json["profile_picture"] ?? '',
        reply: json["reply"] == null
            ? []
            : List<CommentModel>.from(
                json["reply"]!.map((x) => CommentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comment_id": commentId,
        "comment": comment,
        "created_date": createdDate.toIso8601String(),
        "name": name,
        "profile_picture": profilePicture,
        "reply": reply == null
            ? []
            : List<dynamic>.from(reply!.map((x) => x.toJson())),
      };
}
