import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotosNotifier extends StateNotifier<String> {
  PhotosNotifier() : super('');

  void getAll() {
    state = '';
  }

  void getAlbumId1() {
    state = '1';
  }

  void getAlbumId2() {
    state = '2';
  }
}
