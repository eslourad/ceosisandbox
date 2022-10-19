import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';

import 'Models/model.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class HomeScreen2 extends ConsumerWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");

    final watchedpostprovider = ref.watch(postFutureProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('simple riverpod fetch api'),
        ),
        body: watchedpostprovider.when(
          data: ((watchedpostprovider) {
            List<Post> post = watchedpostprovider.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: post.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.blue,
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                  'ID:${post[index].id.toString()} ${post[index].title}'),
                              subtitle: Text(post[index].body),
                              trailing: Text(
                                  'userID:${post[index].userId.toString()}'),
                            ),
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
