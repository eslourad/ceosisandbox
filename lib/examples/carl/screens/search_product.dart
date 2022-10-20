import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';

import '../Models/model.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class SearchScreen extends ConsumerWidget {
  SearchScreen(this.userId, {super.key});
  String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");

    final watchedsearchpostprovider =
        ref.watch(SearchpostFutureProvider(userId));
    return Scaffold(
        appBar: AppBar(
          title: const Text('simple riverpod fetch api'),
        ),
        body: watchedsearchpostprovider.when(
          data: ((watchedsearchpostprovider) {
            Post post = watchedsearchpostprovider;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.blue,
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                  'ID:${post.id.toString()} ${post.title}'),
                              subtitle: Text(post.body),
                              trailing:
                                  Text('userID:${post.userId.toString()}'),
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
