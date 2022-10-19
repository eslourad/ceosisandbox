import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Models/model.dart';
import '../Repository/post_repository.dart';

final postProvider = Provider<PostRepository>((ref) => PostRepository());
final postFutureProvider = FutureProvider.autoDispose<List<Post>>((ref) async {
  return ref.watch(postProvider).fetchPosts();
});
