import 'package:flutter/material.dart';
import 'package:sandbox/widgets/submit_button.dart';

import '../../widgets/auth_textfield.dart';
import '../../widgets/link_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  bool _isProcessing = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  void registerUser() {
    print('register api called');
    setState(() {
      _isProcessing = true;
    });

    // mock register api call
    Future.delayed(const Duration(seconds: 5)).then((value) {
      print(_nameController.text.toString());
      print(_emailController.text.toString());
      print(_passwordController.text.toString());
      print(_confirmpasswordController.text.toString());

      setState(() {
        _isProcessing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _registerFormKey,
            child: Column(
              children: [
                AuthTextFormField(
                    textController: _nameController, label: "Name"),
                AuthTextFormField(
                    textController: _emailController, label: "Email"),
                AuthTextFormField(
                  textController: _passwordController,
                  label: "Password",
                  isObscure: true,
                ),
                AuthTextFormField(
                  textController: _confirmpasswordController,
                  label: "Confirm Password",
                  isObscure: true,
                  isConfirmPassword: true,
                  passwordController: _passwordController,
                ),
                SubmitButton(
                  label: 'Submit',
                  formKey: _registerFormKey,
                  isProcessing: _isProcessing,
                  validated: () {
                    if (_registerFormKey.currentState!.validate()) {
                      registerUser();
                    }
                  },
                )
              ],
            ),
          ),
          LinkButton(
            label: 'Login',
            otherPage: () => const LoginScreen(),
          ),
        ],
      ),
    );
  }
}
