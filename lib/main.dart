import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/carl/home_screen.dart';
import 'package:sandbox/examples/test6_screen.dart';

import 'examples/Chloie/screens/photo_list_screen.dart';

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
