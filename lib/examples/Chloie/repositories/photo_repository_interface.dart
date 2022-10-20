import '../models/photoModel.dart';

abstract class PhotoRepositoryInterface {
  Future<List<PhotoModel>> getAllPhotos();
  Future<PhotoModel> getPhoto(String id);
  Future<PhotoModel> getFilterPhoto(String id);
}
