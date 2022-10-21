import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';

class PhotosFilterNotifier extends StateNotifier<String> {
  PhotosFilterNotifier() : super('');

  void photofilter(String userid) {
    state = userid;
  }
}

class PhotosListNotifier extends StateNotifier<AsyncValue<List<PhotoModel>>> {
  PhotosListNotifier() : super(const AsyncValue.data(<PhotoModel>[]));

  getListPhotos(String photoList) {
    state = photoList as AsyncValue<List<PhotoModel>>;
  }
}
