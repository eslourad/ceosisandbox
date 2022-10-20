import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/models/post_model.dart';
import 'package:sandbox/examples/june/providers.dart';
import 'package:sandbox/examples/june/screens/single_post_screen.dart';

import '../constants/labels.dart';

class PostListWidget extends ConsumerWidget {
  const PostListWidget({
    Key? key,
    required this.postList,
  }) : super(key: key);

  final List<PostListModel> postList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  trailing: Text('${Label.userID} ${postList[index].userId}'),
                  onTap: () {
                    ref.read(postStateProvider.notifier).state = PostModel(
                      userId: postList[index].userId,
                      id: postList[index].id,
                      title: postList[index].title,
                      body: postList[index].body,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SinglePostScreen(),
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
  }
}
