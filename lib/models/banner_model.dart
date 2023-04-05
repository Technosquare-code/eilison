// To parse this JSON data, do
//
//     final bannerListModel = bannerListModelFromJson(jsonString);

import 'dart:convert';

BannerListModel bannerListModelFromJson(String str) =>
    BannerListModel.fromJson(json.decode(str));

String bannerListModelToJson(BannerListModel data) =>
    json.encode(data.toJson());

class BannerListModel {
  BannerListModel({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory BannerListModel.fromJson(Map<String, dynamic> json) =>
      BannerListModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.bannerUrl,
    required this.bannerImage,
  });

  String bannerUrl;
  String bannerImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bannerUrl: json["banner_url"],
        bannerImage: json["banner_image"],
      );

  Map<String, dynamic> toJson() => {
        "banner_url": bannerUrl,
        "banner_image": bannerImage,
      };
}
