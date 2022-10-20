import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/data_providers.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';

class PhotoDetailsScreen extends ConsumerWidget {
  const PhotoDetailsScreen({Key? key, required this.photoModel})
      : super(key: key);
  final PhotoModel photoModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photo = ref.watch(singlePhotoDataProvider(photoModel.id));
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              )),
        ),
        body: photo.when(
            data: ((data) => Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Center(
                        child: CircleAvatar(
                          maxRadius: 120,
                          backgroundImage:
                              NetworkImage(photoModel.thumbnailUrl),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(photoModel.id.toString() + '. ' + photoModel.title)
                    ],
                  ),
                )),
            error: ((error, stackTrace) => Text(error.toString())),
            loading: (() => const Center(child: CircularProgressIndicator()))));
  }
}
