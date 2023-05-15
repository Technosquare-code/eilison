// To parse this JSON data, do
//
//     final userSessionModel = userSessionModelFromJson(jsonString);

import 'dart:convert';

List<UserSessionModel> userSessionModelFromJson(String str) =>
    List<UserSessionModel>.from(
        json.decode(str).map((x) => UserSessionModel.fromJson(x)));

String userSessionModelToJson(List<UserSessionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserSessionModel {
  String id;
  String coachId;
  String sessionName;
  String agenda;
  String sessionType;
  String image;
  String description;
  DateTime sessionDate;
  String sessionTime;
  DateTime sessionDatetime;
  String sessionStartDatetime;
  DateTime sessionEndDatetime;
  String duration;
  String zoomLink;
  String isDeleted;
  String status;
  DateTime createdDate;
  String? sessionCategoryName;
  bool? is_joined;

  UserSessionModel({
    required this.id,
    required this.coachId,
    required this.sessionName,
    required this.agenda,
    required this.sessionType,
    required this.image,
    required this.description,
    required this.sessionDate,
    required this.sessionTime,
    required this.sessionDatetime,
    required this.sessionStartDatetime,
    required this.sessionEndDatetime,
    required this.duration,
    required this.zoomLink,
    required this.isDeleted,
    required this.status,
    required this.createdDate,
    this.sessionCategoryName,
    this.is_joined,
  });

  factory UserSessionModel.fromJson(Map<String, dynamic> json) =>
      UserSessionModel(
          id: json["id"],
          coachId: json["coach_id"],
          sessionName: json["session_name"],
          agenda: json["agenda"],
          sessionType: json["session_type"],
          image: json["image"],
          description: json["description"],
          sessionDate: DateTime.parse(json["session_date"]),
          sessionTime: json["session_time"],
          sessionDatetime: DateTime.parse(json["session_datetime"]),
          sessionStartDatetime: json["session_start_datetime"],
          sessionEndDatetime: DateTime.parse(json["session_end_datetime"]),
          duration: json["duration"],
          zoomLink: json["zoom_link"],
          isDeleted: json["is_deleted"],
          status: json["status"],
          createdDate: DateTime.parse(json["created_date"]),
          sessionCategoryName: json["session_category_name"] ?? '',
          is_joined: json['is_joined'] == '1' ? true : false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "coach_id": coachId,
        "session_name": sessionName,
        "agenda": agenda,
        "session_type": sessionType,
        "image": image,
        "description": description,
        "session_date":
            "${sessionDate.year.toString().padLeft(4, '0')}-${sessionDate.month.toString().padLeft(2, '0')}-${sessionDate.day.toString().padLeft(2, '0')}",
        "session_time": sessionTime,
        "session_datetime": sessionDatetime.toIso8601String(),
        "session_start_datetime": sessionStartDatetime,
        "session_end_datetime": sessionEndDatetime.toIso8601String(),
        "duration": duration,
        "zoom_link": zoomLink,
        "is_deleted": isDeleted,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "session_category_name": sessionCategoryName,
      };
}
