// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

List<PhotoModel> photoFromJson(String str) =>
    List<PhotoModel>.from(json.decode(str).map((x) => PhotoModel.fromJson(x)));

String photoToJson(List<PhotoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoModel {
  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"]);

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
