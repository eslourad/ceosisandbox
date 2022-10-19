import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/model/post_model.dart';
import 'package:sandbox/examples/Lance/providers/providers.dart';
import 'package:sandbox/examples/Lance/screens/single_product_page.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureProvider = ref.watch(postFutureProvider);
    final singlePostProvider = ref.watch(getSinglePostProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Post'),
          centerTitle: true,
        ),
        body: futureProvider.when(data: ((data) {
          return ListView(
            children: [
              for (int i = 0; i < data!.length; i++)
                ListTile(
                  onTap: () {
                    ref.read(getSinglePostProvider.notifier).state = Post(
                      body: data[i].body,
                      title: data[i].title,
                      userId: data[i].userId,
                      id: data[i].id,
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SingleProductPage()));
                  },
                  title: Text(data[i].title!),
                  subtitle: Text(data[i].body!),
                ),
            ],
          );
        }), error: ((error, stackTrace) {
          return const Text('Error Retrieving Data');
        }), loading: (() {
          return const Center(child: CircularProgressIndicator());
        })));
  }
}
