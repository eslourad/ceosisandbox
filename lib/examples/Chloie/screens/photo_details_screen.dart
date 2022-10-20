import 'package:flutter/material.dart';
import 'package:sandbox/examples/Chloie/models/photoModel.dart';

class PhotoDetailsScreen extends StatelessWidget {
  const PhotoDetailsScreen({Key? key, required this.photo}) : super(key: key);
  final PhotoModel photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                maxRadius: 120,
                backgroundImage: NetworkImage(photo.thumbnailUrl),
              ),
            ),
            const SizedBox(height: 50),
            Text(photo.title),
          ],
        ),
      ),
    );
  }
}
