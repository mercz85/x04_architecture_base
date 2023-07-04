import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:x04_architecture_base/src/common/inherited_widgets/theme_inherited_widget.dart';

import '../auth_bloc.dart';
//import 'widgets.dart';

class AuthProvidersRow extends StatelessWidget {
  const AuthProvidersRow({
    super.key,
    required this.bloc,
  });

  final AuthBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider()),
              Text('  Or continue with  '),
              Expanded(child: Divider()),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoogleFAB(
              onPressed: () async => await bloc.loginWithGoogle(),
            ),
            const SizedBox(width: 12),
            AppleFAB(
              onPressed: () async => await bloc.loginWithApple(),
            ),
          ],
        ),
      ],
    );
  }
}

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
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: const Icon(
        FontAwesomeIcons.google,
        color: Colors.red,
        size: 32,
      ),
    );
  }
}

class AppleFAB extends StatelessWidget {
  final void Function()? onPressed;
  const AppleFAB({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ThemeInheritedWidget themeInheritedWidget =
    //     ThemeInheritedWidget.of(context);
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
    // Color backgroundColor = themeInheritedWidget.isThemeDark == true
    //     ? const Color.fromARGB(255, 27, 28, 28) //Colors.white
    //     : Colors.white; //Colors.grey[850];
    // Color onBackgroundColor =
    //     ThemeInheritedWidget.of(context).isThemeDark == true
    //         ? Colors.white
    //         : const Color.fromARGB(255, 41, 43, 43); // Colors.white;

    return FloatingActionButton(
      heroTag: 'appleFAB',
      backgroundColor: Colors.white, // Colors.grey[850],
      onPressed: onPressed,
      child: const Icon(
        FontAwesomeIcons.apple,
        color: Color.fromARGB(255, 41, 43, 43), // Colors.white,
        size: 32,
      ),
    );
  }
}
