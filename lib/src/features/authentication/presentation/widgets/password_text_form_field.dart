import 'package:flutter/material.dart';

class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Please enter a password.' : null;
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    required super.key,
    required this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      decoration: const InputDecoration(labelText: 'Enter a password'),
      onSaved: onSaved,
      validator: (value) => PasswordFieldValidator.validate(value!),
      obscureText: true,
    );
  }
}
