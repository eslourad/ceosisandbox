import '../model/post_model.dart';

abstract class PostRepositoryInterface {
  Future<List<PostLance>?> getPostLance(String url);

  getSingleProduct(String id);
}
