import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sandbox/examples/test_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEOSI Flutter Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MainScreen(),
      home: const TestScreen(),
// =======
//       home: const TestScreen(),
// >>>>>>> 5f393a420738c0009e724ceebb651ef91c5d04a2
    );
  }
}
