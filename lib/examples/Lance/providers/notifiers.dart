import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/model/post_model.dart';
import 'package:sandbox/examples/Lance/repositories/post_repositories.dart';

class PostsNotifier extends StateNotifier<AsyncValue<List<PostLance>>> {
  PostsNotifier(
    this.ref, [
    AsyncValue<List<PostLance>>? posts,
  ]) : super(posts ?? const AsyncValue.loading()) {
    getPosts();
  }

  final Ref ref;

  Future<void> getPosts() async {
    try {
      final posts = await PostRepository()
          .getPostLance(ref.watch(filterProvider.notifier).state);
      state = AsyncValue.data(posts);
    } catch (error, _) {
      state = AsyncValue.error(error, _);
    }
  }
}

final sortedListPostProvider =
    StateNotifierProvider<PostsNotifier, AsyncValue<List<PostLance>>>((ref) {
  return PostsNotifier(ref);
});

final filterProvider = StateProvider<String>((ref) {
  return 'posts';
});
