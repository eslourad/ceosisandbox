import 'package:http/http.dart' as http;
import 'package:sandbox/examples/Lance/api_config.dart';
import 'package:sandbox/examples/Lance/repositories/post_repository_interface.dart';

import '../model/post_model.dart';
import '../model/single_post_model.dart';

class PostRepository implements PostRepositoryInterface {
  @override
  Future<List<PostLance>> getPostLance(String url1) async {
    Uri url = Uri.parse(ApiConfigurationLance().baseUrl + url1);

    print(url);
    var response = await http.get(url);
    return postFromJson(response.body);
  }

  @override
  getSingleProduct(String id) async {
    var client = http.Client();
    var response = await client
        .get(Uri.parse('${ApiConfigurationLance().baseUrl}/posts/$id'));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return singlePostModelFromJson(response.body);
      }
    } catch (e) {
      print('An error has occurred!');
      print(response.body);
    }

    return null;
  }
}
