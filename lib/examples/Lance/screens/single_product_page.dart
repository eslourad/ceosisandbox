import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/providers/get_single_product_provider.dart';

class SingleProductPage extends ConsumerWidget {
  const SingleProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureProvider = ref.watch(singlePostFutureProvider(
        ref.read(getSinglePostProvider.state).state.id.toString()));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Single Post'),
        ),
        body: futureProvider.when(
          data: ((data) {
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Title"),
                Text(data!.title!),
                const SizedBox(
                  height: 20,
                ),
                const Text("Body"),
                Text(data.body!),
              ],
            );
            return null;
          }),
          error: ((error, stackTrace) {
            return const Text('Error Retrieving Data');
          }),
          loading: (() {
            return const Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
