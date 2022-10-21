import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListFilterNotifier extends StateNotifier<String> {
  PostListFilterNotifier() : super('');

  void filter(String userID) {
    state = userID.isNotEmpty ? '?userId=$userID' : '';
  }
}
