import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.label,
    required this.formKey,
    required this.isProcessing,
    required this.validated,
  }) : super(key: key);

  final String label;
  final GlobalKey<FormState> formKey;
  final bool isProcessing;
  final Function() validated;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isProcessing ? null : validated,
      child: const Text('Submit'),
    );
  }
}
