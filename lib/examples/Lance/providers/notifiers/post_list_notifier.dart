import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfPostNotifier extends StateNotifier<String> {
  ListOfPostNotifier() : super('posts');

  void userId1() {
    state = 'posts?userId=1';
  }

  void userId2() {
    state = 'posts?userId=2';
  }

  void all() {
    state = 'posts';
  }
}
