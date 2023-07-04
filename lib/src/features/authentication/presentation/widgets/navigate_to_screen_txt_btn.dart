import 'package:flutter/material.dart';

class NavigateToScreenTxtBtn extends StatelessWidget {
  const NavigateToScreenTxtBtn({
    super.key,
    required this.onPressed,
    required this.text,
    required this.clickableText,
  });
  final void Function()? onPressed;
  final String text;
  final String clickableText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.65)),
                ),
                SizedBox(width: 4),
                Text(
                  clickableText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.65)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
