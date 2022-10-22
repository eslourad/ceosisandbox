import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// MODEL
List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}

// REPOSITORY
class PostRepository {
  Future<List<Post>> getPosts(String query) async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts$query");
    var response = await http.get(url);
    return postFromJson(response.body);
  }
}

// PROVIDER
class PostNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  PostNotifier(
    this.ref, [
    AsyncValue<List<Post>>? posts,
  ]) : super(posts ?? const AsyncValue.loading()) {
    _getPosts();
  }

  final Ref ref;

  Future<void> _getPosts() async {
    try {
      final posts = await PostRepository().getPosts("");
      state = AsyncValue.data(posts);
    } catch (error, _) {
      state = AsyncValue.error(error, _);
    }
  }

  Future<void> _filterId(String query) async {
    String finalQuery = query == '' ? query : '?userId=$query';
    try {
      final posts = await PostRepository().getPosts(finalQuery);
      state = AsyncValue.data(posts);
    } catch (error, _) {
      state = AsyncValue.error(error, _);
    }
  }
}

final postsNotifierProvider =
    StateNotifierProvider<PostNotifier, AsyncValue<List<Post>>>((ref) {
  return PostNotifier(ref);
});

// SCREEN
class TestScreen7 extends ConsumerWidget {
  const TestScreen7({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsState = ref.watch(postsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CEOSI"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              FilterIdButton(ref: ref, label: "All", queryId: ""),
              FilterIdButton(ref: ref, label: "1", queryId: "1"),
              FilterIdButton(ref: ref, label: "2", queryId: "2"),
            ],
          ),
          postsState.when(
            data: (posts) {
              return PostsList(posts: posts);
            },
            error: (error, _) => Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

class FilterIdButton extends StatelessWidget {
  const FilterIdButton({
    required this.ref,
    required this.label,
    required this.queryId,
    Key? key,
  }) : super(key: key);

  final WidgetRef ref;
  final String label;
  final String queryId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          ref.watch(postsNotifierProvider.notifier)._filterId(queryId);
        },
        child: Text(label));
  }
}

class PostsList extends StatelessWidget {
  const PostsList({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostItem(post: posts[index]);
          }),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Text(post.userId.toString()),
    );
  }
}
