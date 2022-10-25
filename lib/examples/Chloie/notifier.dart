import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/repositories/photo_repository.dart';

class PhotoListNotifier extends StateNotifier<AsyncValue<List<PhotoModel>>> {
  PhotoListNotifier(
    this.ref, [
    AsyncValue<List<PhotoModel>>? photo,
  ]) : super(photo ?? const AsyncValue.loading()) {
    getPhotos();
  }
  final Ref ref;
  Future<void> getPhotos() async {
    final photo = await PhotoRepository().getFilterPhoto('');
    state = AsyncValue.data(photo);
  }

  Future<void> filterId(String id) async {
    String albumId = id == '' ? id : '?albumId=$id';

    final photo = await PhotoRepository().getFilterPhoto(albumId);
    state = AsyncValue.data(photo);
  }
}
