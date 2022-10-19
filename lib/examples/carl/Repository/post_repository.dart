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
}
