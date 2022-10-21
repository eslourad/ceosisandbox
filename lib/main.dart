import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/examples/Lance/screens/my_home_page.dart';

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
      home: const MyHomePage(),
    );
  }
}
