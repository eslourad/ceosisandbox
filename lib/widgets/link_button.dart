import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key? key,
    required this.label,
    this.otherPage,
  }) : super(key: key);

  final String label;
  final Widget Function()? otherPage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => otherPage!(),
        ));
      },
      child: Text(label),
    );
  }
}
