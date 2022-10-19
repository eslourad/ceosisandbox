import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/screens/photo_list_screen.dart';

final photoDataProvider = FutureProvider<List<PhotoModel>>((ref) async {
  return ref.read(postRepositoryProvider).getAllPhotos();
});
