import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';
import 'package:sandbox/examples/Chloie/notifier.dart';
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
          SizedBox(height: 10),
          // PhotoWidget(),
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
    final textfieldController = TextEditingController();
    final photo = ref.watch(photoDataProvider);
    String photoId = ref.watch(filterPhotoProvider);
    final filteredphotos = ref.watch(filterPhotoDataProvider(photoId));
    return Expanded(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(
          controller: textfieldController,
          decoration: const InputDecoration(
            labelText: 'Search',
          ),
          onSubmitted: (value) {
            if (textfieldController.text.isEmpty) {
              ref.refresh(photoDataProvider);
            } else {
              ref.read(filterPhotoProvider.notifier).photofilter(value);
            }
          },
        ),
      ),
      SizedBox(height: 10),
      Expanded(
        child: RefreshIndicator(
            onRefresh: () async => await ref.refresh(photoDataProvider),
            child: photo.when(
                data: ((filteredphotos) {
                  List<PhotoModel> photos = filteredphotos;
                  // final PhotoModel photos;
                  return ListView.builder(
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        InkWell(
                          onTap: (() =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PhotoDetailsScreen(
                                        photoModel: photos[index],
                                      )))),
                          child: ListTile(
                            leading: Uri.parse(photos[index].url).isAbsolute
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(photos[index].url),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.black,
                                  ),
                            title: Text(photos[index].id.toString() +
                                '. ' +
                                photos[index].title),
                            subtitle: Text("AlbumId: ${photos[index].albumId}"),
                          ),
                        )
                      ]);
                    },
                  );
                }),
                error: ((error, stackTrace) => Text(error.toString())),
                loading: (() =>
                    const Center(child: CircularProgressIndicator())))),
      )
    ]));
  }
}
