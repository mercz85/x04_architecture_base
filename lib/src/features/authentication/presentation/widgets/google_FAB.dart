import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleFAB extends StatelessWidget {
  final void Function()? onPressed;
  const GoogleFAB({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'googleFAB',
      backgroundColor: Colors.red,
      onPressed: onPressed,
      child: const Icon(
        FontAwesomeIcons.google,
        color: Colors.white,
      ),
    );
  }
}
