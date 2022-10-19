import 'dart:convert';
import '../models/photoModel.dart';
import 'package:http/http.dart' as http;

import 'photo_repository_interface.dart';

class PhotoRepository implements PhotoRepositoryInterface {
  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(result);
      List<PhotoModel> photos = [];
      for (var jsonPhoto in result) {
        PhotoModel photo = PhotoModel.fromJson(jsonPhoto);
        photos.add(photo);
      }
      return photos;
    } else {
      return <PhotoModel>[];
    }
  }
}
