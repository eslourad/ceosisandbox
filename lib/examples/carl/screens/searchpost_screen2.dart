import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';
import '../Models/model.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class SearchPostScreen extends ConsumerWidget {
  SearchPostScreen(this.userId, {super.key});
  String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");
    String userId2 = ref.watch(userIdPostNotifierProvider);
    final watchedsearchpostprovider =
        ref.watch(SearchpostFutureProvider(userId2));

    AsyncValue<List<Post>> watchuserIdlistpost =
        ref.watch(userIdListPostNotifierProvider);

    ref.read(userIdListPostNotifierProvider.notifier).fetchListwithUser(
        watchedsearchpostprovider); //READ THE SEARCHPOST WITH USERID  TO FETCH THE LIST

    return Scaffold(
        appBar: AppBar(
          title: const Text('simple riverpod fetch api'),
        ),
        body: watchuserIdlistpost.when(
          data: ((watchuserIdlistpost) {
            List<Post> post = watchuserIdlistpost.map((e) => e).toList();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: post.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            color: const Color.fromARGB(255, 235, 233, 135),
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
