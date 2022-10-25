import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';
import 'package:sandbox/examples/june/notifiers/post_list_notifier.dart';
import 'package:sandbox/examples/june/repositories/post_repository.dart';

//Post Repository Provider
final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository());
//Future Provider for all posts
final postsFutureProvider = FutureProvider<List<PostListModel>?>(
  (ref) async {
    return ref.watch(postRepositoryProvider).getPosts();
  },
);
// Future Provider for single post
final postFutureProvider =
    FutureProvider.family.autoDispose<PostModel?, String>(
  (ref, postID) async {
    return ref.watch(postRepositoryProvider).getPost(postID);
  },
);
// State Provider for single post
final postStateProvider = StateProvider<PostModel>(
  (ref) {
    return PostModel();
  },
);
// State Notifier Provider for filtered post list
final filteredPostsProvider = StateNotifierProvider.autoDispose<
    FilteredPostsNotifier, AsyncValue<List<PostListModel>?>>(
  (ref) {
    return FilteredPostsNotifier(ref);
  },
);
