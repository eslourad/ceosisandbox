import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/providers/providers.dart';

import '../model/post_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: const Consumer(),
    );
  }
}

class Consumer extends ConsumerWidget {
  const Consumer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var futureProvider =
        ref.watch(postFutureProvider(ref.watch(filterProvider.notifier).state));

    final filterController = TextEditingController();
    return SizedBox(
      child: futureProvider.when(
        data: ((data) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: filterController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            print(
                                'state ${ref.watch(filterProvider.notifier).state}');
                            ref.read(filterProvider.notifier).state =
                                filterController.text == ''
                                    ? 'posts'
                                    : 'posts?userId=${filterController.text}';

                            print(
                                'state2 ${ref.watch(filterProvider.notifier).state}');

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyHomePage(),
                                ));
                          },
                          icon: const Icon(Icons.search)),
                      label: const Text('Search Filter')),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       MaterialButton(
              //           color: Colors.blue,
              //           onPressed: (() {
              //             ref.read(getPostProvider.notifier).all();

              //             Navigator.pushReplacement(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => const MyHomePage(),
              //                 ));
              //           }),
              //           child: const Text(
              //             'All',
              //             style: TextStyle(color: Colors.white),
              //           )),
              //       MaterialButton(
              //           color: Colors.blue,
              //           child: const Text(
              //             '1',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           onPressed: () {
              //             ref.read(getPostProvider.notifier).userId1();

              //             Navigator.pushReplacement(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => const MyHomePage(),
              //                 ));
              //           }),
              //       MaterialButton(
              //           color: Colors.blue,
              //           child: const Text(
              //             '2',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           onPressed: () {
              //             ref.read(getPostProvider.notifier).userId2();

              //             Navigator.pushReplacement(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => const MyHomePage(),
              //                 ));
              //           }),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Posts from : ${ref.read(filterProvider.notifier).state}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                      separatorBuilder: ((context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            color: Colors.blue,
                            thickness: 2,
                          ),
                        );
                      }),
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
                          title: Text(
                            data[index].title!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          subtitle: Text(
                            data[index].body!,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14),
                          ),
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
