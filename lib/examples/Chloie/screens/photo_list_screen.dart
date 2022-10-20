import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/screens/photo_details_screen.dart';
import '../data_providers.dart';
import '../repositories/photo_repository.dart';

final postRepositoryProvider = StateProvider((_) => PhotoRepository());

class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: const [
          Text("Photos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 20),
          PhotoWidget()
        ],
      ),
    );
  }
}

class PhotoWidget extends ConsumerWidget {
  const PhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(photoDataProvider);
    return Expanded(
        child: photo.when(
            data: (photo) {
              return ListView.builder(
                itemCount: photo.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    InkWell(
                      onTap: (() => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => PhotoDetailsScreen(
                                  photo: PhotoModel(
                                      albumId: photo[index].albumId,
                                      id: photo[index].id,
                                      title: photo[index].title,
                                      url: photo[index].url,
                                      thumbnailUrl:
                                          photo[index].thumbnailUrl))))),
                      child: ListTile(
                          leading: Uri.parse(photo[index].url).isAbsolute
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(photo[index].url),
                                )
                              : Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                          title: Text(photo[index].title)),
                    )
                  ]);
                },
              );
            },
            error: ((error, stackTrace) => Text(error.toString())),
            loading: (() => const Center(child: CircularProgressIndicator()))));
  }
}
