import 'package:flutter/material.dart';

import '../auth_bloc.dart';
import 'widgets.dart';

class AuthProvidersColumn extends StatelessWidget {
  const AuthProvidersColumn({
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
