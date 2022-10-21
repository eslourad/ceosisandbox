import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';

class PostListFilterNotifier extends StateNotifier<String> {
  PostListFilterNotifier() : super('');

  void filter(String userID) {
    state = userID.isNotEmpty ? '?userId=$userID' : '';
  }
}

class FilteredPostsNotifier
    extends StateNotifier<AsyncValue<List<PostListModel>?>> {
  FilteredPostsNotifier() : super(const AsyncValue.data(<PostListModel>[]));

  void filter(AsyncValue<List<PostListModel>?> list) {
    Future.delayed(const Duration(seconds: 0)).then((value) => state = list);
  }
}
