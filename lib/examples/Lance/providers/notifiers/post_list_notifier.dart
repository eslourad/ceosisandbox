import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/model/post_model.dart';
import 'package:sandbox/examples/Lance/repositories/post_repositories.dart';

class PostsNotifier extends StateNotifier<AsyncValue<List<PostLance>>> {
  PostsNotifier() : super(const AsyncValue.data(<PostLance>[]));

  getData(url) {
    try {
      state = PostRepository().getPosts(url) as AsyncValue<List<PostLance>>;
    } catch (e) {
      print('bogo error');
    }
  }
}
