// To parse this JSON data, do
//
//     final ratingListModel = ratingListModelFromJson(jsonString);

import 'dart:convert';

List<RatingListModel> ratingListModelFromJson(String str) =>
    List<RatingListModel>.from(
        json.decode(str).map((x) => RatingListModel.fromJson(x)));

String ratingListModelToJson(List<RatingListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RatingListModel {
  String name;
  String? profilePicture;
  String rating;
  String review;
  DateTime createdDate;

  RatingListModel({
    required this.name,
    this.profilePicture,
    required this.rating,
    required this.review,
    required this.createdDate,
  });

  factory RatingListModel.fromJson(Map<String, dynamic> json) =>
      RatingListModel(
        name: json["name"],
        profilePicture: json["profile_picture"],
        rating: json["rating"],
        review: json["review"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_picture": profilePicture,
        "rating": rating,
        "review": review,
        "created_date": createdDate.toIso8601String(),
      };
}
