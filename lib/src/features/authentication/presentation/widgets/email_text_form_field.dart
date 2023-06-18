import 'package:flutter/material.dart';

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
      decoration: const InputDecoration(labelText: 'Enter your email'),
      onSaved: onSaved,
      validator: (value) => EmailFieldValidator.validate(value!),
    );
  }
}
