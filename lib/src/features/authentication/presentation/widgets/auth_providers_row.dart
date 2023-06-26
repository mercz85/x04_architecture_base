import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Or sign in with:',
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 1,
              child: GoogleFAB(
                onPressed: () async => await bloc.loginWithGoogle(),
              ),
            ),
            Expanded(
              child: AppleFAB(
                onPressed: () async => await bloc.loginWithApple(),
              ),
            ),
            Expanded(child: Container()),
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
      backgroundColor: Colors.red,
      onPressed: onPressed,
      child: const Icon(
        FontAwesomeIcons.google,
        color: Colors.white,
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
