import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';
import 'package:sandbox/examples/june/providers.dart';

import '../constants/labels.dart';

class SinglePostScreen extends ConsumerWidget {
  const SinglePostScreen({super.key, required this.model});
  final PostListModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postFutureProvider(model.id.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Text(Label.singlePostTitle),
        centerTitle: true,
      ),
      body: data.when(
          data: (data) {
            PostModel post = data!;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(width: 50.0),
                          CircleAvatar(
                            radius: 50.0,
                            child: Text(
                              post.id.toString(),
                              style: const TextStyle(
                                  fontSize: 50.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: 50.0,
                            padding: const EdgeInsets.all(5.0),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0))),
                            child: Text(
                              '${Label.userID} ${post.userId.toString()}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        data.title,
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        data.body!,
                        style: const TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
