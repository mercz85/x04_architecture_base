// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppleFAB extends StatelessWidget {
  final void Function()? onPressed;
  const AppleFAB({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'appleFAB',
      backgroundColor: Colors.grey[850],
      onPressed: onPressed,
      child: const Icon(
        FontAwesomeIcons.apple,
        color: Colors.white,
      ),
    );
  }
}
