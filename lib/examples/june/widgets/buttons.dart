import 'package:flutter/material.dart';

class FilterItemButton extends StatelessWidget {
  const FilterItemButton(
      {super.key,
      this.height = 40.0,
      required this.onPressed,
      required this.label});
  final double height;
  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          height: height,
          child: TextButton(
            onPressed: onPressed,
            child: Text(label),
          )),
    );
  }
}
