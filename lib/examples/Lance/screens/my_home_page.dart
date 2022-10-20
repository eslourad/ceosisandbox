import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/providers/providers.dart';

import '../model/post_model.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var futureProvider =
        ref.watch(postFutureProvider(ref.read(getPostProvider.notifier).state));

    return Scaffold(
      appBar: AppBar(
        title: Text(ref.read(getPostProvider.notifier).state),
        centerTitle: true,
      ),
      body: Consumer(futureProvider: futureProvider),
    );
  }
}

class Consumer extends ConsumerWidget {
  const Consumer({
    Key? key,
    required this.futureProvider,
  }) : super(key: key);

  final AsyncValue<List<PostLance>?> futureProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: futureProvider.when(
        data: ((data) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: (() {
                        ref.read(getPostProvider.notifier).all();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ));
                      }),
                      child: const Text('All')),
                  MaterialButton(
                      color: Colors.blue,
                      child: const Text('1'),
                      onPressed: () {
                        ref.read(getPostProvider.notifier).userId1();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ));
                      }),
                  MaterialButton(
                      color: Colors.blue,
                      child: const Text('2'),
                      onPressed: () {
                        ref.read(getPostProvider.notifier).userId2();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ));
                      }),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          onTap: () {
                            ref.read(getSinglePostProvider.notifier).state =
                                PostLance(
                              body: data[index].body,
                              title: data[index].title,
                              userId: data[index].userId,
                              id: data[index].id,
                            );
                            print(data[index].body);
                            print(data[index].title);
                            print(data[index].userId);
                            print(data[index].id);
                          },
                          title: Text(data[index].title!),
                          subtitle: Text(data[index].body!),
                        );
                      })),
                ),
              ),
            ],
          );
        }),
        error: ((error, stackTrace) {
          print(error);
          return const Text('Error Retrieving Data');
        }),
        loading: (() {
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
