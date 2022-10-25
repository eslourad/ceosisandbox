import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';
import 'package:sandbox/examples/carl/screens/singlepost_screen2.dart';
import '../Models/model.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class PostListScreen2 extends ConsumerWidget {
  PostListScreen2(this.userId, {super.key});
  String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");

    final watchedsearchpostprovider =
        ref.watch(SearchpostFutureProvider(userId)); //the list to be passed

    AsyncValue<List<Post>> watchuserIdlistpost = ref.watch(
        userIdListPostNotifierProvider(userId)); //the latest list searched

    ref.read(userIdListPostNotifierProvider(userId).notifier).fetchListwithUser(
        watchedsearchpostprovider); //READ THE SEARCHEDPOST WITH USERID  TO FETCH THE LIST

    return Scaffold(
        appBar: AppBar(
          title: const Text('simple riverpod fetch api'),
        ),
        body: watchuserIdlistpost.when(
          data: ((watchuserIdlistpost) {
            List<Post> post = watchuserIdlistpost.map((e) => e).toList();
            return Column(
              children: [
                TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    onSubmitted: (value) {
                      userId = value;

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostListScreen2(userId),
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
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            var id = post[index].id.toString();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SinglePostScreen(id),
                            ));
                          },
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
