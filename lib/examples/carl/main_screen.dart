import 'package:flutter/material.dart';
import 'package:sandbox/examples/carl/screens/postlist_screen2.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  @override
  Widget build(BuildContext context) {
    return PostListScreen2();
  }
}
