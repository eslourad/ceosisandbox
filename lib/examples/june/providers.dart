import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';
import 'package:sandbox/examples/june/repositories/post_repository.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository());
final postsFutureProvider = FutureProvider.autoDispose<List<PostListModel>?>(
  (ref) async {
    return ref.watch(postRepositoryProvider).getPosts();
  },
);
final postFutureProvider =
    FutureProvider.family.autoDispose<PostModel?, String>(
  (ref, postID) async {
    return ref.watch(postRepositoryProvider).getPost(postID);
  },
);
