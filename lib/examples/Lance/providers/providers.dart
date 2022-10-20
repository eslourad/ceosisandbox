import 'package:riverpod/riverpod.dart';
import 'package:sandbox/examples/Lance/repositories/post_repositories.dart';

import '../model/post_model.dart';
import '../model/single_post_model.dart';
import 'notifiers/post_list_notifier.dart';

// Getting the data in a single postas
final singlePostRepositoryProvider = Provider.family<SinglePostModel?, String>(
    (ref, id) => PostRepository().getSingleProduct(id));

final singlePostFutureProvider =
    FutureProvider.family.autoDispose<SinglePostModel?, String>((ref, id) {
  return ref.read(singlePostRepositoryProvider(id));
});

final getSinglePostProvider = StateProvider<PostLance>((ref) {
  return PostLance();
});

// Getting posts data in different UID
final getPostProvider = // Getting the state of the state notifier
    StateNotifierProvider<ListOfPostNotifier, String>((ref) {
  return ListOfPostNotifier();
});

final postRepositoryProvider = // Passing the state of the state notifier to the base url of the api
    Provider.family<Future<List<PostLance>?>, String>((ref, url) {
  return PostRepository().getPosts(url);
});

final postFutureProvider = // Getting the data of the api from postRepositoryProvider
    FutureProvider.family.autoDispose<List<PostLance>?, String>((ref, url) {
  return ref.read(postRepositoryProvider(url));
});
