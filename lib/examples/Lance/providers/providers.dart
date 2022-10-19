import 'package:riverpod/riverpod.dart';
import 'package:sandbox/examples/Lance/repositories/post_repositories.dart';

import '../model/post_model.dart';

// Provider
final postRepositoryProvider = Provider.autoDispose<Future<List<Post>?>>(
    (ref) => PostRepository().getPosts('posts'));

// Future Provider
final postFutureProvider = FutureProvider.autoDispose<List<Post>?>((ref) {
  return ref.read(postRepositoryProvider);
});

// State Provider
final getSinglePostProvider = StateProvider.autoDispose<Post>((ref) {
  return Post();
});
