import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/model.dart';
import '../Repository/post_repository.dart';

final postProvider = Provider<PostRepository>((ref) => PostRepository());

///postlist
final postFutureProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  return ref.watch(postProvider).fetchPosts();
});

///singlepostlist
final SinglepostFutureProvider =
    FutureProvider.autoDispose.family<Post, String>((ref, id) async {
  return ref.watch(postProvider).fetchSinglePosts(id);
});

///searchpostlist from statenotififer

final SearchpostFutureProvider =
    FutureProvider.autoDispose.family<List<Post>, String>((ref, userId) async {
  return ref.watch(postProvider).searchPosts(userId);
});

///searchpostlist with statenotifier
class UserIdPostNotifier extends StateNotifier<String> {
  UserIdPostNotifier() : super('');

  showallwithUserID(String userId) {
    state = userId;
  }
}

final userIdPostNotifierProvider =
    StateNotifierProvider.autoDispose<UserIdPostNotifier, String>((ref) {
  return UserIdPostNotifier();
});
