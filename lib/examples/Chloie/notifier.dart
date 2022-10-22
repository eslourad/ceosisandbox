import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/repositories/photo_repository.dart';

class PhotoListNotifier extends StateNotifier<AsyncValue<List<PhotoModel>>> {
  final Ref ref;
  PhotoListNotifier(
    this.ref, [
    AsyncValue<List<PhotoModel>>? photo,
  ]) : super(photo ?? const AsyncValue.loading()) {
    void getPhotos() async {
      final photo = await PhotoRepository().getAllPhotos("");
      state = AsyncValue.data(photo);
    }

    void filterId(String id) async {
      String albumId = id == '' ? id : '?albumId=$id';

      final photo = await PhotoRepository().getAllPhotos(albumId);
      state = AsyncValue.data(photo);
    }
  }
}

class PhotosFilterNotifier extends StateNotifier<AsyncValue<List<PhotoModel>>> {
  PhotosFilterNotifier(this.ref) : super(const AsyncValue.data(<PhotoModel>[]));
  final Ref ref;
  void photofilter(String id) async {
    String albumId = id == '' ? id : '?albumId=$id';
    final photo = await PhotoRepository().getAllPhotos(albumId);
    state = AsyncValue.data(photo);
  }
}
