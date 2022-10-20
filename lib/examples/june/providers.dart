import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';
import 'package:sandbox/examples/june/notifiers/post_list_filter_notifier.dart';
import 'package:sandbox/examples/june/repositories/post_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository());
final postsFutureProvider =
    FutureProvider.family.autoDispose<List<PostListModel>?, String>(
  (ref, query) async {
    return ref.watch(postRepositoryProvider).getPosts(query: query);
  },
);
final postFutureProvider =
    FutureProvider.family.autoDispose<PostModel?, String>(
  (ref, postID) async {
    return ref.watch(postRepositoryProvider).getPost(postID);
  },
);
final postsFilterProvider =
    StateNotifierProvider.autoDispose<PostListFilterNotifier, String>(
  (ref) {
    return PostListFilterNotifier();
  },
);
