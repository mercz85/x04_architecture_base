import 'package:flutter/material.dart';

class NavigateToScreenTxtBtn extends StatelessWidget {
  const NavigateToScreenTxtBtn({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
