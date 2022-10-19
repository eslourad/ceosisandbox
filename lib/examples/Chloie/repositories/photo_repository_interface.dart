import '../models/photoModel.dart';

abstract class PhotoRepositoryInterface {
  Future<List<PhotoModel>> getAllPhotos();
}
