import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFieldValidator {
  // static String? validate(String value) {
  //   return value.isEmpty ? 'Please enter a password.' : null;
  // }

  // static String? validatePasswordMatching(String value1, String? value2) {
  //   return value1 != value2
  //       ? 'Passwords don\'t match. Write them again.'
  //       : null;
  // }

  static String? validate(String value, String? confirmPassword) {
    String? result;

    result = value.isEmpty ? 'Please enter a password.' : null;

    if (result == null && confirmPassword != null) {
      result = value != confirmPassword
          ? 'Passwords don\'t match. Write them again.'
          : null;
    }

    return result;
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    required super.key,
    required this.text,
    this.onSaved,
    this.getConfirmPasswordValue,
  });
  final String text;
  final void Function(String?)? onSaved;
  final String? Function()? getConfirmPasswordValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      decoration: InputDecoration(
        labelText: text,
        icon: const Icon(FontAwesomeIcons.lock),
      ),
      onSaved: onSaved,
      validator: (value) {
        var confirmPassword =
            getConfirmPasswordValue != null ? getConfirmPasswordValue!() : null;
        String? result =
            PasswordFieldValidator.validate(value!, confirmPassword);
        return result;
      },
      obscureText: true,
    );
  }
}
