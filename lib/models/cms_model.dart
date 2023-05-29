// To parse this JSON data, do
//
//     final cmsModel = cmsModelFromJson(jsonString);

import 'dart:convert';

CmsModel cmsModelFromJson(String str) => CmsModel.fromJson(json.decode(str));

String cmsModelToJson(CmsModel data) => json.encode(data.toJson());

class CmsModel {
  String status;
  List<Datum> data;

  CmsModel({
    required this.status,
    required this.data,
  });

  factory CmsModel.fromJson(Map<String, dynamic> json) => CmsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String? privacyPolicy;
  String? coachPrivacyPolicy;
  String? termsConditions;
  String? coachTermsConditions;
  String? aboutUs;
  String? returnRefundsPolicy;

  Datum(
      {this.privacyPolicy,
      this.termsConditions,
      this.aboutUs,
      this.returnRefundsPolicy,
      this.coachPrivacyPolicy,
      this.coachTermsConditions});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      privacyPolicy: json["privacy_policy"],
      termsConditions: json["terms_conditions"],
      aboutUs: json["about_us"],
      returnRefundsPolicy: json["return_refunds_policy"],
      coachTermsConditions: json['coach_terms_conditions'],
      coachPrivacyPolicy: json['coach_privacy_policy']);

  Map<String, dynamic> toJson() => {
        "privacy_policy": privacyPolicy,
        "terms_conditions": termsConditions,
        "about_us": aboutUs,
        "return_refunds_policy": returnRefundsPolicy,
      };
}
