import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFieldValidator {
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

class PasswordTextFormField extends StatefulWidget {
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
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool passwordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      decoration: InputDecoration(
        hintText: widget.text,
        prefixIcon: const Icon(FontAwesomeIcons.lock),
        suffixIcon: GestureDetector(
          child: Icon(
            Icons.visibility,
            color: passwordObscureText == true
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          ),
          onTap: () {
            setState(() {
              passwordObscureText = passwordObscureText == true ? false : true;
            });
          },
        ),
      ),
      onSaved: widget.onSaved,
      validator: (value) {
        var confirmPassword = widget.getConfirmPasswordValue != null
            ? widget.getConfirmPasswordValue!()
            : null;
        String? result =
            PasswordFieldValidator.validate(value!, confirmPassword);
        return result;
      },
      obscureText: passwordObscureText,
    );
  }
}
