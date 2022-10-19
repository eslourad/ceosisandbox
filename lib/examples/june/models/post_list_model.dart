import 'dart:convert';

List<PostListModel> postListModelFromJson(String str) =>
    List<PostListModel>.from(
        json.decode(str).map((x) => PostListModel.fromJson(x)));

class PostListModel {
  PostListModel({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory PostListModel.fromJson(Map<String, dynamic> json) => PostListModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
