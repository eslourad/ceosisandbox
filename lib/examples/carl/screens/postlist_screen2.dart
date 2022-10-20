import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Models/model.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';
import 'package:sandbox/examples/carl/screens/searchpost_screen2.dart';
import 'package:sandbox/examples/carl/screens/singlepost_screen2.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class PostListScreen2 extends ConsumerWidget {
  const PostListScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");

    final watchedpostprovider = ref.watch(postFutureProvider);
    final watchuserIdpostshow = ref.watch(userIdPostNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('simple riverpod fetch api'),
        ),
        body: watchedpostprovider.when(
          data: ((watchedpostprovider) {
            List<Post> post = watchedpostprovider.map((e) => e).toList();
            return Column(
              children: [
                TextField(
                    onSubmitted: (value) {
                      ref
                          .read(userIdPostNotifierProvider.notifier)
                          .showallwithUserID(value);

                      print(ref
                          .read(userIdPostNotifierProvider.notifier)
                          .showallwithUserID(value));
                      print(watchuserIdpostshow);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SearchPostScreen(watchuserIdpostshow),
                      ));
                    },
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: const Icon(Icons.search),
                    )),
                Expanded(
                  child: ListView.builder(
                      itemCount: post.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromARGB(255, 235, 233, 135),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            onTap: () {
                              var id = post[index].id.toString();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SinglePostScreen(id),
                              ));
                            },
                            title: Text(
                                'ID:${post[index].id.toString()} ${post[index].title}'),
                            subtitle: Text(post[index].body),
                            trailing:
                                Text('userID:${post[index].userId.toString()}'),
                          ),
                        );
                      }),
                ),
              ],
            );
          }),
          error: ((error, stackTrace) {
            return const Text('error');
          }),
          loading: (() {
            return const Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
