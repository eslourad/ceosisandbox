import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/models/post_list_model.dart';
import 'package:sandbox/examples/june/providers.dart';
import 'package:sandbox/examples/june/widgets/buttons.dart';
import 'package:sandbox/examples/june/widgets/post_list_widget.dart';

import '../constants/labels.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String query = ref.watch(postsFilterProvider);
    final data = ref.watch(postsFutureProvider(query));
    return Scaffold(
      appBar: AppBar(
        title: const Text(Label.postListTitle),
        centerTitle: true,
      ),
      body: data.when(
        data: (data) {
          List<PostListModel> postList = data!.map((e) => e).toList();
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filterAll()),
                        label: Label.all),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter1()),
                        label: Label.one),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter2()),
                        label: Label.two),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter3()),
                        label: Label.three),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter4()),
                        label: Label.four),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter5()),
                        label: Label.five),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter6()),
                        label: Label.six),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter7()),
                        label: Label.seven),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter8()),
                        label: Label.eight),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter9()),
                        label: Label.nine),
                    FilterItemButton(
                        onPressed: (() =>
                            ref.read(postsFilterProvider.notifier).filter10()),
                        label: Label.ten),
                  ],
                ),
              ),
              Expanded(child: PostListWidget(postList: postList)),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
