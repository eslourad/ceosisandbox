import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/notifier.dart';
import 'repositories/photo_repository.dart';

final photoRepositoryProvider = StateProvider((_) => PhotoRepository());

final photoDataProvider = FutureProvider<List<PhotoModel>>((ref) async {
  return ref.read(photoRepositoryProvider).getAllPhotos("");
});

final singlePhotoDataProvider =
    FutureProvider.family.autoDispose<PhotoModel, int>(
  (ref, id) async {
    return ref.read(photoRepositoryProvider).getPhoto(id.toString());
  },
);

final filteredPhotoDataProvider =
    FutureProvider.family.autoDispose<List<PhotoModel>, int>(
  (ref, id) async {
    return ref.read(photoRepositoryProvider).getAllPhotos(id.toString());
  },
);

final listPhotoProvider =
    StateNotifierProvider<PhotoListNotifier, AsyncValue<List<PhotoModel>>>(
        (ref) {
  return PhotoListNotifier(ref);
});
