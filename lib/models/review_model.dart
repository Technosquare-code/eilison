// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(
    json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  String id;
  String rating;
  String review;
  DateTime createdDate;
  String name;
  String profilePicture;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.review,
    required this.createdDate,
    required this.name,
    required this.profilePicture,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        rating: json["rating"],
        review: json["review"],
        createdDate: DateTime.parse(json["created_date"]),
        name: json["name"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "review": review,
        "created_date": createdDate.toIso8601String(),
        "name": name,
        "profile_picture": profilePicture,
      };
}
