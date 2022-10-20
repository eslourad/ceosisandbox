import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Models/model.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class SinglePostScreen extends ConsumerWidget {
  SinglePostScreen(this.id, {super.key});
  String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");
    print(id);
    // final watchedsinglepostprovider =
    //     ref.watch(singlePostRepositoryProvider2(id));
    final watchedsinglepostprovider = ref.watch(SinglepostFutureProvider(id));
    print(watchedsinglepostprovider.toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text('simple riverpod fetch api'),
        ),
        body: watchedsinglepostprovider.when(
          data: ((watchedsinglepostprovider) {
            Post post = watchedsinglepostprovider;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            color: const Color.fromARGB(255, 235, 233, 135),
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
            print(error);
            print(stackTrace);
            return const Text('error');
          }),
          loading: (() {
            return const Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
