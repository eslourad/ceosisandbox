import 'package:flutter/material.dart';

import '../../widgets/link_button.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinkButton(
        label: 'Register',
        otherPage: () => const Center(child: RegisterScreen()),
      ),
    );
  }
}
