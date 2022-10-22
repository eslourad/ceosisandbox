import 'dart:convert';

import '../models/photoModel.dart';
import 'package:http/http.dart' as http;
import 'photo_repository_interface.dart';

class PhotoRepository implements PhotoRepositoryInterface {
  @override
  Future<List<PhotoModel>> getAllPhotos(String id) async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      return photoFromJson(response.body);
    } else {
      throw Exception('Unable to Get all Photos');
    }
  }

  @override
  Future<PhotoModel> getPhoto(String id) async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos/$id"));
    if (response.statusCode == 200) {
      print(response.body);
      return PhotoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unable to Get Photo');
    }
  }

  // @override
  // Future<List<PhotoModel>> getFilterPhoto(String id) async {
  //   var response = await http.get(
  //       Uri.parse("https://jsonplaceholder.typicode.com/photos?albumId=$id"));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return photoFromJson(response.body);
  //   } else {
  //     throw Exception('Unable to Get Photos');
  //   }
  // }
}
