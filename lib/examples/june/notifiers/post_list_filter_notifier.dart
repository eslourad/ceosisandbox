import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/providers.dart';

class PostListFilterNotifier extends StateNotifier<String> {
  PostListFilterNotifier() : super('');

  void filter(String userID) {
    state = userID.isNotEmpty ? '?userId=$userID' : '';
  }
}
