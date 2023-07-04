import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Please enter an email.' : null;
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    required super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      decoration: const InputDecoration(
        hintText: 'Enter your email.',
        prefixIcon: Icon(FontAwesomeIcons.envelope),
      ),
      onSaved: onSaved,
      validator: (value) => EmailFieldValidator.validate(value!),
    );
  }
}
