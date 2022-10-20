import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/screens/photo_details_screen.dart';
import '../data_providers.dart';
import '../repositories/photo_repository.dart';

final photoRepositoryProvider = StateProvider((_) => PhotoRepository());

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
          FilterWidget()
        ],
      ),
    );
  }
}

class FilterWidget extends ConsumerWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int albumId;

    final photo = ref.watch(photoDataProvider);
    //  final filterPhoto = ref.watch(filterPhotoDataProvider(albumId));
    return Expanded(
        child: Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                ref.read(filterPhotoProvider.notifier).getAll();
              },
              child: const Text("All"),
            ),
            TextButton(
              onPressed: () {
                ref.read(filterPhotoProvider.notifier).getAlbumId1();
              },
              child: const Text("1"),
            ),
            TextButton(
              onPressed: () {
                ref.read(filterPhotoProvider.notifier).getAlbumId2();
              },
              child: const Text("2"),
            ),
          ],
        ),
        Expanded(
            child: photo.when(
                data: (photo) {
                  return ListView.builder(
                    itemCount: photo.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        InkWell(
                          onTap: (() =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PhotoDetailsScreen(
                                        photoModel: photo[index],
                                      )))),
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
                              title: Text(photo[index].id.toString() +
                                  '. ' +
                                  photo[index].title)),
                        )
                      ]);
                    },
                  );
                },
                error: ((error, stackTrace) => Text(error.toString())),
                loading: (() =>
                    const Center(child: CircularProgressIndicator()))))
      ],
    ));
  }
}
