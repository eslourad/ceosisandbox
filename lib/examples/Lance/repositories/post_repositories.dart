import 'package:http/http.dart' as http;
import 'package:sandbox/examples/Lance/api_config.dart';

import '../model/post_model.dart';

class PostRepository {
  Future<List<Post>?> getPosts(String url) async {
    var client = http.Client();
    var uri = Uri.parse(ApiConfigurationLance().baseUrl + url);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
    return null;
  }
}
