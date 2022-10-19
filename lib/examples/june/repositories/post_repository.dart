import 'package:http/http.dart' as http;
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';
import 'package:sandbox/examples/june/repositories/post_repository_interface.dart';

import '../constants/endpoints.dart';
import '../services/api_service.dart';

class PostRepository implements PostRepositoryInterface {
  @override
  Future<List<PostListModel>?> getPosts() async {
    try {
      var client = http.Client();
      var response = await client.get(ApiService.url(endpoint: EndPoint.posts));

      if (response.statusCode == 200) {
        print(response.body);
        return postListModelFromJson(response.body);
      }
    } catch (e) {
      print('An error has occurred!');
      throw Exception(e);
    }

    return null;
  }

  @override
  Future<PostModel?> getPost(String postID) async {
    try {
      var client = http.Client();
      var response = await client
          .get(ApiService.url(endpoint: EndPoint.posts, query: postID));

      if (response.statusCode == 200) {
        print(response.body);
        return postModelFromJson(response.body);
      }
    } catch (e) {
      print('An error has occurred!');
      throw Exception(e);
    }

    return null;
  }
}
