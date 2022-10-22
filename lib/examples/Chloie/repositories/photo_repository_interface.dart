import '../models/photoModel.dart';

abstract class PhotoRepositoryInterface {
  Future<List<PhotoModel>> getAllPhotos(String id);
  Future<PhotoModel> getPhoto(String id);
  // Future<List<PhotoModel>> getFilterPhoto(String id);
}
