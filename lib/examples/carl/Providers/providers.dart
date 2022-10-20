import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/model.dart';
import '../Repository/post_repository.dart';

final postProvider = Provider<PostRepository>((ref) => PostRepository());
final postFutureProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  return ref.watch(postProvider).fetchPosts();
});

final SinglepostFutureProvider =
    FutureProvider.autoDispose.family<Post, String>((ref, id) async {
  return ref.watch(postProvider).fetchSinglePosts(id);
});

final SearchpostFutureProvider =
    FutureProvider.autoDispose.family<Post, String>((ref, userId) async {
  return ref.watch(postProvider).fetchSinglePosts(userId);
});

class UserIdPostNotifier extends StateNotifier<String> {
  UserIdPostNotifier() : super('');

  showallwithUserID(String userId) {
    state = userId;
  }
}

final userIdPostProvider =
    StateNotifierProvider<UserIdPostNotifier, String>((ref) {
  return UserIdPostNotifier();
});
