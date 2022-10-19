import '../model/post_model.dart';

abstract class PostRepositoryInterface {
  Future<List<Post>?> getPosts(String url);
}
