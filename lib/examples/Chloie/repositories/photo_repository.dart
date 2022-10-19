import '../models/photoModel.dart';
import 'package:http/http.dart' as http;
import 'photo_repository_interface.dart';

class PhotoRepository implements PhotoRepositoryInterface {
  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      return photoFromJson(response.body);
    } else {
      throw Exception('Unable to Get all Photos');
    }
  }
}
