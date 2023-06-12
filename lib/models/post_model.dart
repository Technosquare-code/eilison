// To parse this JSON data, do
//
//     final postListModel = postListModelFromJson(jsonString);

import 'dart:convert';

List<PostListModel> postListModelFromJson(String str) =>
    List<PostListModel>.from(
        json.decode(str).map((x) => PostListModel.fromJson(x)));

String postListModelToJson(List<PostListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostListModel {
  String id;
  String uid;
  String postContent;
  String postMedia;
  String isVideo;
  String isImage;
  int totalLike;
  int totalComment;
  bool isLike;
  String status;
  String userProfile;
  String userName;
  DateTime createdDate;

  PostListModel({
    required this.id,
    required this.uid,
    required this.postContent,
    required this.userName,
    required this.userProfile,
    required this.postMedia,
    required this.isVideo,
    required this.isImage,
    required this.totalLike,
    required this.totalComment,
    required this.status,
    required this.createdDate,
    required this.isLike,
  });

  factory PostListModel.fromJson(Map<String, dynamic> json) => PostListModel(
        id: json["id"].toString(),
        uid: json["uid"].toString(),
        postContent: json["post_content"],
        // postHashtags: json["post_hashtags"],
        postMedia: json["post_media"],
        isVideo: json["is_video"],
        isImage: json["is_image"],
        totalLike:
            json["total_like"] != null ? int.parse(json["total_like"]) : 0,
        totalComment: json["total_comment"] != null
            ? int.parse(json["total_comment"])
            : 0,
        status: json["status"],
        userName: json['userName'],
        userProfile: json['userProfile'] ?? '',
        isLike: json['is_like'] == '1' ? true : false,
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "post_content": postContent,
        // "post_hashtags": postHashtags,
        "post_media": postMedia,
        "is_video": isVideo,
        "is_image": isImage,
        "total_like": totalLike,
        "total_comment": totalComment,
        "status": status,
        "created_date": createdDate.toIso8601String(),
      };
}
