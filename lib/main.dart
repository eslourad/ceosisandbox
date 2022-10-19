import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD
import 'package:sandbox/examples/carl/home_screen.dart';
=======
import 'package:sandbox/examples/Chloie/screens/photo_list_screen.dart';
import 'package:sandbox/screens/main_screen.dart';
import 'package:sandbox/examples/test_screen.dart';
import 'examples/test2_screen.dart';
import 'examples/test3_screen.dart';
import 'examples/test4_screen.dart';
>>>>>>> a401732c0a79a88ae1b6e357be4fcc1399205617

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
<<<<<<< HEAD
      home: const HomeScreen2(),
=======
      home: const PhotoListScreen(),
>>>>>>> a401732c0a79a88ae1b6e357be4fcc1399205617
    );
  }
}
