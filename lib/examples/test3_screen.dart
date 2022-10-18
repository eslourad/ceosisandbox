import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class TestScreen3 extends ConsumerWidget {
  const TestScreen3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TEST 3 I am being rebuild");
    final rng = Random();
    const int firstNumber = 1;
    const int secondNumber = 2;
    //int thirdNumber = 3;
    final thirdNumber = ref.watch(thirdNumberProvider);

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstNumber.toString()),
            Text(secondNumber.toString()),
            Text(thirdNumber.toString()),
            TextButton(
              onPressed: () {
                ref.read(thirdNumberProvider.notifier).state = rng.nextInt(100);
                ;
              },
              child: const Text("Change third number"),
            )
          ],
        ),
      ),
    );
  }
}
