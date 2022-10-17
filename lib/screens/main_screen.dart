import 'package:flutter/material.dart';

import 'auth/login_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    String token = "";

    return token != ""
        ? Scaffold(
            appBar: AppBar(
              title: const Text("CEOSI"),
            ),
            body: const HomeScreen(),
          )
        : const LoginScreen();
  }
}
