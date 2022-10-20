import 'dart:math';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final int _firstNumber = 1;
  final int _secondNumber = 2;
  int _thirdNumber = 3;

  void _changeNumber3() {
    final rng = Random();
    setState(() {
      _thirdNumber = rng.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("TEST 1 I am being rebuild (EDITED FOR REPO DEMO)");
    print("TEST 1 I am being rebuild FOR DEMO 2");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_firstNumber.toString()),
          Text(_secondNumber.toString()),
          Text(_thirdNumber.toString()),
          TextButton(
            onPressed: () {
              _changeNumber3();
            },
            child: const Text("Change third number"),
          )
        ],
      ),
    );
  }
}
