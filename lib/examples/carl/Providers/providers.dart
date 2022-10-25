import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/model.dart';
import '../Repository/post_repository.dart';

final postProvider = Provider<PostRepository>((ref) => PostRepository());

///singlepostlist
final SinglepostFutureProvider =
    FutureProvider.autoDispose.family<Post, String>((ref, id) async {
  return ref.watch(postProvider).fetchSinglePosts(id);
});

///searchpostlist from search box and shows all post as default
final SearchpostFutureProvider =
    FutureProvider.autoDispose.family<List<Post>, String>((ref, userId) async {
  return ref.watch(postProvider).searchPosts(userId);
});

//LISTFETCHER
class ListofUserIdPostNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  ListofUserIdPostNotifier(this.userId)
      : super(const AsyncValue.data(<Post>[]));
  String userId;

  fetchListwithUser(AsyncValue<List<Post>> ListofUserId) {
    Future.delayed(const Duration(seconds: 0)).then((value) {
      state = ListofUserId;
    });
  }
}

final userIdListPostNotifierProvider = StateNotifierProvider.autoDispose
    .family<ListofUserIdPostNotifier, AsyncValue<List<Post>>, String>(
        (ref, userId) {
  return ListofUserIdPostNotifier(userId);
});
