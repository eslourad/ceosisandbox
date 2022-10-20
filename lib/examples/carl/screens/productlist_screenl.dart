import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/Models/model.dart';
import 'package:sandbox/examples/carl/Providers/providers.dart';
import 'package:sandbox/examples/carl/screens/search_product.dart';
import 'package:sandbox/examples/carl/screens/singleproduct_screen.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");

    final watchedpostprovider = ref.watch(postFutureProvider);
    final watchuserIdpostshow = ref.watch(userIdPostProvider);

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
                          .read(userIdPostProvider.notifier)
                          .showallwithUserID(value);

                      var userId = value;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchScreen(userId),
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
                          color: Colors.blue,
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