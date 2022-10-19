import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/providers.dart';
import 'package:sandbox/examples/june/screens/single_post_screen.dart';

import '../constants/labels.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postsFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Label.postListTitle),
        centerTitle: true,
      ),
      body: data.when(
        data: (data) {
          List<PostListModel> postList = data!.map((e) => e).toList();
          return Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(postList[index].id.toString()),
                        ),
                        title: Text(
                          postList[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          postList[index].body ?? '',
                          style: const TextStyle(fontSize: 12.0),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing:
                            Text('${Label.userID} ${postList[index].userId}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SinglePostScreen(model: postList[index]),
                              ));
                        },
                      ),
                      const Divider(
                        thickness: 2.0,
                        indent: 20.0,
                      ),
                    ],
                  );
                },
              )),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
