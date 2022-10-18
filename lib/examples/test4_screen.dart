import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class TestScreen4 extends StatelessWidget {
  const TestScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    print("TEST 4 I am being rebuild");
    const int firstNumber = 1;
    const int secondNumber = 2;
    //int thirdNumber = 3;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstNumber.toString()),
            Text(secondNumber.toString()),
            const ThirdNumberWidget()
          ],
        ),
      ),
    );
  }
}

class ThirdNumberWidget extends ConsumerWidget {
  const ThirdNumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rng = Random();
    final thirdNumber = ref.watch(thirdNumberProvider);
    return Column(
      children: [
        Text(thirdNumber.toString()),
        TextButton(
          onPressed: () {
            ref.read(thirdNumberProvider.notifier).state = rng.nextInt(100);
            ;
          },
          child: const Text("Change third number"),
        ),
      ],
    );
  }
}
