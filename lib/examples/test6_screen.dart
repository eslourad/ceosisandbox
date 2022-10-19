import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThirdNumberNotifier extends StateNotifier<int> {
  ThirdNumberNotifier() : super(0);

  void makeIt27() {
    state = 27;
  }

  void randomNumber() {
    final rng = Random();
    state = rng.nextInt(100);
  }

  void withParameter(int value) {
    state = value;
  }
}

final todosProvider = StateNotifierProvider<ThirdNumberNotifier, int>((ref) {
  return ThirdNumberNotifier();
});

class TestScreen6 extends StatelessWidget {
  const TestScreen6({super.key});

  @override
  Widget build(BuildContext context) {
    print("TEST 6 I am being rebuild");
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
    int thirdNumber = ref.watch(todosProvider);

    return Column(
      children: [
        Text(thirdNumber.toString()),
        TextButton(
          onPressed: () {
            ref.read(todosProvider.notifier).makeIt27();
          },
          child: const Text("Make it 27"),
        ),
        TextButton(
          onPressed: () {
            ref.read(todosProvider.notifier).randomNumber();
          },
          child: const Text("RNG"),
        ),
        TextButton(
          onPressed: () {
            ref.read(todosProvider.notifier).withParameter(8);
          },
          child: const Text("With parameter (8)"),
        ),
      ],
    );
  }
}
