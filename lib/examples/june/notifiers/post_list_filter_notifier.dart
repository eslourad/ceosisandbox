import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListFilterNotifier extends StateNotifier<String> {
  PostListFilterNotifier() : super('');

  void filterAll() {
    state = '';
  }

  void filter1() {
    state = '?userId=1';
  }

  void filter2() {
    state = '?userId=2';
  }

  void filter3() {
    state = '?userId=3';
  }

  void filter4() {
    state = '?userId=4';
  }

  void filter5() {
    state = '?userId=5';
  }

  void filter6() {
    state = '?userId=6';
  }

  void filter7() {
    state = '?userId=7';
  }

  void filter8() {
    state = '?userId=8';
  }

  void filter9() {
    state = '?userId=9';
  }

  void filter10() {
    state = '?userId=10';
  }
}
