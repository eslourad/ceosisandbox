import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final thirdNumberProvider = StateProvider((_) => 3);

class TestScreen2 extends StatelessWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    print("TEST 2 I am being rebuild");
    final rng = Random();
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
            Consumer(
              builder: (context, WidgetRef ref, __) {
                final thirdNumber = ref.watch(thirdNumberProvider);
                return Column(
                  children: [
                    Text(thirdNumber.toString()),
                    TextButton(
                      onPressed: () {
                        ref.read(thirdNumberProvider.notifier).state =
                            rng.nextInt(100);
                        ;
                      },
                      child: const Text("Change third number"),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
