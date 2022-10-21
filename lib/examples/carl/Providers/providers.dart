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

//LISTFETCHER

class ListofUserIdPostNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  ListofUserIdPostNotifier() : super(const AsyncValue.data(<Post>[]));

  fetchListwithUser(AsyncValue<List<Post>> ListofUserId) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      state = ListofUserId;
    });
  }
}

final userIdListPostNotifierProvider = StateNotifierProvider.autoDispose<
    ListofUserIdPostNotifier, AsyncValue<List<Post>>>((ref) {
  return ListofUserIdPostNotifier();
});
