// To parse this JSON data, do
//
//     final sessionListModel = sessionListModelFromJson(jsonString);

import 'dart:convert';

List<SessionListModel> sessionListModelFromJson(String str) =>
    List<SessionListModel>.from(
        json.decode(str).map((x) => SessionListModel.fromJson(x)));

String sessionListModelToJson(List<SessionListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SessionListModel {
  String id;
  String coachId;
  String sessionName;
  String agenda;
  String sessionType;
  String image;
  String description;
  String sessionDate;
  String sessionTime;
  String sessionDatetime;
  String duration;
  String zoomLink;
  String isDeleted;
  String status;
  DateTime createdDate;
  String sessionCategoryName;

  SessionListModel({
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
    required this.duration,
    required this.zoomLink,
    required this.isDeleted,
    required this.status,
    required this.createdDate,
    required this.sessionCategoryName,
  });

  factory SessionListModel.fromJson(Map<String, dynamic> json) =>
      SessionListModel(
        id: json["id"],
        coachId: json["coach_id"],
        sessionName: json["session_name"],
        agenda: json["agenda"],
        sessionType: json["session_type"],
        image: json["image"],
        description: json["description"],
        sessionDate: json["session_date"],
        sessionTime: json["session_time"],
        sessionDatetime: json["session_datetime"],
        duration: json["duration"],
        zoomLink: json["zoom_link"],
        isDeleted: json["is_deleted"],
        status: json["status"],
        createdDate: DateTime.parse(json["created_date"]),
        sessionCategoryName: json["session_category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coach_id": coachId,
        "session_name": sessionName,
        "agenda": agenda,
        "session_type": sessionType,
        "image": image,
        "description": description,
        "session_date": sessionDate,
        "session_time": sessionTime,
        "session_datetime": sessionDatetime,
        "duration": duration,
        "zoom_link": zoomLink,
        "is_deleted": isDeleted,
        "status": status,
        "created_date": createdDate.toIso8601String(),
        "session_category_name": sessionCategoryName,
      };
}
