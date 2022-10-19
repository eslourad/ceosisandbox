import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Chloie/screens/photo_list_screen.dart';
import 'package:sandbox/screens/main_screen.dart';
import 'package:sandbox/examples/test_screen.dart';
import 'examples/test2_screen.dart';
import 'examples/test3_screen.dart';
import 'examples/test4_screen.dart';

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
      home: const PhotoListScreen(),
    );
  }
}
