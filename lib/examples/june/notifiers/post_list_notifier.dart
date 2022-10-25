import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/providers.dart';

class FilteredPostsNotifier
    extends StateNotifier<AsyncValue<List<PostListModel>?>> {
  FilteredPostsNotifier(
    this.ref, [
    AsyncValue<List<PostListModel>>? posts,
  ]) : super(posts ?? const AsyncValue.loading()) {
    _getPosts();
  }

  final Ref ref;

  void _getPosts() {
    final posts = ref.watch(postsFutureProvider);
    state = posts;
  }

  void filter(String id) async {
    String userID = id.isNotEmpty ? '?userId=$id' : '';
    final posts =
        await ref.read(postRepositoryProvider).getPosts(query: userID);
    state = AsyncValue.data(posts);
  }
}
