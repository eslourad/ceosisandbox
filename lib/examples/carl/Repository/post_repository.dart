import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/model.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    print(response.statusCode);

    final List result = jsonDecode(response.body);
    return result.map(((e) => Post.fromJson(e))).toList();
  }

  Future<List<Post>> searchPosts(String userId) async {
    Uri url =
        Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=$userId");
    final response = await http.get(url);
    print(response.statusCode);

    final List result = jsonDecode(response.body);
    return result.map(((e) => Post.fromJson(e))).toList();
  }

  Future<Post> fetchSinglePosts(String id) async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    final response = await http.get(url);
    print(response.statusCode);

    return Post.fromJson(json.decode(response.body));
  }

  // Future<Post> searchPosts(String userId) async {
  //   Uri url =
  //       Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=$userId");
  //   final response = await http.get(url);
  //   print(response.statusCode);
  //   print(response.body);

  //   return Post.fromJson(json.decode(response.body));
  // }
}
