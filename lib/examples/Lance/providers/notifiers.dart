import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/model/post_model.dart';
import 'package:sandbox/examples/Lance/repositories/post_repositories.dart';

class PostsNotifier extends StateNotifier<Future<List<PostLance>>> {
  PostsNotifier() : super(Future<List<PostLance>>.value());

  getData(url) {
    state = PostRepository().getPosts(url);
  }
}

final sortedListPostProvider =
    StateNotifierProvider<PostsNotifier, Future<List<PostLance>>>((ref) {
  return PostsNotifier();
});

final postFutureProvider = // Getting the data of the api from postRepositoryProvider
    FutureProvider.family<List<PostLance>, String>((ref, url) {
  return ref
      .read(sortedListPostProvider.notifier)
      .getData(ref.watch(filterProvider.notifier).state);
});

final filterProvider = StateProvider<String>((ref) {
  return 'posts';
});
