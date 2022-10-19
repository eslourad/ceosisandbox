import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';

abstract class PostRepositoryInterface {
  Future<List<PostListModel>?> getPosts();
  Future<PostModel?> getPost(String postID);
}
