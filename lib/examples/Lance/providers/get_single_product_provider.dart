import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/providers/notifiers.dart';
import 'package:sandbox/examples/Lance/repositories/post_repositories.dart';

import '../model/post_model.dart';
import '../model/single_post_model.dart';

// Getting the data in a single postas
final singlePostRepositoryProvider = Provider.family<SinglePostModel?, String>(
    (ref, id) => PostRepository().getSingleProduct(id));

final singlePostFutureProvider =
    FutureProvider.family.autoDispose<SinglePostModel?, String>((ref, id) {
  return ref.read(singlePostRepositoryProvider(id));
});

final postsFutureProvider = // Getting the data of the api from postRepositoryProvider
    FutureProvider.family<List<PostLance>, String>((ref, url) {
  return PostRepository().getPosts(ref.watch(filterProvider.notifier).state);
});
final getSinglePostProvider = StateProvider<PostLance>((ref) {
  return PostLance();
});

// Getting posts data in different UID
// final getPostProvider = // Getting the state of the state notifier
//     StateNotifierProvider<ListOfPostNotifier, String>((ref) {
//   return ListOfPostNotifier();
// });


