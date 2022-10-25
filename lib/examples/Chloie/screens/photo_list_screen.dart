import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/screens/photo_details_screen.dart';
import '../data_providers.dart';
import '../models/photoModel.dart';

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
    final photos = ref.watch(listPhotoProvider);
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
                ref.refresh(listPhotoProvider);
              } else {
                ref.read(listPhotoProvider.notifier).filterId(value);
              }
            }),
      ),
      const SizedBox(height: 10),
      Expanded(
        child: photos.when(
            data: ((data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    InkWell(
                      onTap: (() =>
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PhotoDetailsScreen(
                                    photoModel: data[index],
                                  )))),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data[index].url),
                        ),
                        title: Text('${data[index].id}. ${data[index].title}'),
                        subtitle: Text("AlbumId: ${data[index].albumId}"),
                      ),
                    )
                  ]);
                },
              );
            }),
            error: ((error, stackTrace) => Text(error.toString())),
            loading: (() => const Center(child: CircularProgressIndicator()))),
      ),
    ]));
  }
}
