// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<PostLance> postFromJson(String str) =>
    List<PostLance>.from(json.decode(str).map((x) => PostLance.fromJson(x)));

String postToJson(List<PostLance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostLance {
  PostLance({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory PostLance.fromJson(Map<String, dynamic> json) => PostLance(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId ?? 0,
        "id": id ?? 0,
        "title": title ?? '',
        "body": body ?? '',
      };
}
