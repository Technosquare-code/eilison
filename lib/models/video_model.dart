// To parse this JSON data, do
//
//     final VideoModel = VideoModelFromJson(jsonString);

import 'dart:convert';

List<VideoModel> VideoModelFromJson(String str) =>
    List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

class VideoModel {
  String videoTitle;
  String videoUrl;
  String youtubeVideoThumbnail;

  VideoModel({
    required this.videoTitle,
    required this.videoUrl,
    required this.youtubeVideoThumbnail,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        videoTitle: json["video_title"]!,
        videoUrl: json["video_url"],
        youtubeVideoThumbnail: json["youtube_video_thumbnail"],
      );
}
