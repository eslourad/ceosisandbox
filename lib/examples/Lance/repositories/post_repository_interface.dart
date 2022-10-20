import '../model/post_model.dart';

abstract class PostRepositoryInterface {
  Future<List<PostLance>?> getPosts(String url);

  getSingleProduct(String id);
}
