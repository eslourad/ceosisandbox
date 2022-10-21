import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/june/providers.dart';

class SearchFilter extends ConsumerWidget {
  SearchFilter({super.key});

  final TextEditingController filterController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    filter() =>
        ref.read(postsFilterProvider.notifier).filter(filterController.text);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        autofocus: false,
        controller: filterController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        ],
        decoration: InputDecoration(
          labelText: "Search Filter",
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3.0, color: Colors.blue),
          ),
          suffixIcon:
              IconButton(onPressed: filter, icon: const Icon(Icons.search)),
        ),
        onSubmitted: (_) => filter(),
      ),
    );
  }
}
