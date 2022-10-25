import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/model.dart';

class PostRepository {
  //allPosts
  Future<List<Post>> fetchPosts() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    print(response.statusCode);

    final List result = jsonDecode(response.body);
    return result.map(((e) => Post.fromJson(e))).toList();
  }

//SearchedPosts
  Future<List<Post>> searchPosts(String userId) async {
    String query = userId.trim().isEmpty ? '' : '?userId=$userId'; //VERYNICE

    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts$query");
    final response = await http.get(url);
    print(response.statusCode);

    final List result = jsonDecode(response.body);
    return result.map(((e) => Post.fromJson(e))).toList();
  }

//SinglePost
  Future<Post> fetchSinglePosts(String id) async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
    final response = await http.get(url);
    print(response.statusCode);

    return Post.fromJson(json.decode(response.body));
  }
}
