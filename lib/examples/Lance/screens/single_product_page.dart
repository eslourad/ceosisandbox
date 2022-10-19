import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/providers/providers.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Single Post'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final singlePostData = ref.read(getSinglePostProvider.state);

          return Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Title"),
                  Text(singlePostData.state.title!),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Body"),
                  Text(singlePostData.state.body!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
