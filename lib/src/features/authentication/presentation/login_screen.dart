import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:x04_architecture_base/src/common/common.dart';

import '../../../app/app.dart';
import '../authentication.dart';
import '../domain/domain.dart';
import 'auth_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = AuthBloc();
  final AuthUser _authUser =
      AuthUser(logStatus: LogStatus.loggedOut, authMode: null);
  final _formKey = GlobalKey<FormState>();

  void validateAndSubmit() async {
    final form = _formKey.currentState;
    //Triggers onSave method in Form to set _email and _password
    form!.save();
    if (form.validate()) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        await bloc.loginWithEmailAndPassword(
          _authUser.email!,
          _authUser.password!,
        );
        //TODO sendEmailVerification Firebase
        //await bloc.sendEmailVerification(userCredential.user);
      }
    }
  }

  void navigateToRegisterScreen(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: bloc.authUserStream,
        builder: (context, snapshot) {
          final authUser = snapshot.hasData
              ? snapshot.data! as AuthUser
              : AuthUser(
                  logStatus: LogStatus.loggedOut,
                  authMode: AuthMode.emailAndPassword,
                );

          if (authUser.logStatus == LogStatus.loggedIn) {
            return const MyAppBase();
          } else {
            return GestureDetector(
              //Hide keyboard on tap outside textfield
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                // backgroundColor: ThemeInheritedWidget.of(context).isThemeDark
                //     ? Theme.of(context).colorScheme.background
                //     : Theme.of(context).colorScheme.onPrimary,
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppTitle(
                          text: 'Wellcome back! you\'ve been missed!',
                        ),
                        Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  EmailTextFormField(
                                    key: const Key('emailLoginTextFormField'),
                                    onSaved: (newValue) =>
                                        _authUser.email = newValue,
                                  ),
                                  const SizedBox(height: 10),
                                  PasswordTextFormField(
                                    key:
                                        const Key('passwordLoginTextFormField'),
                                    onSaved: (newValue) =>
                                        _authUser.password = newValue,
                                    text: AuthBloc.enterPassword,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Forgot password?',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.65)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: TextButton(
                                      style: loginButtonStyle(context),
                                      onPressed: () async =>
                                          validateAndSubmit(),
                                      child:
                                          const SignInButtonText(text: 'Login'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        NavigateToScreenTxtBtn(
                          onPressed: () => navigateToRegisterScreen(context),
                          text: 'Haven\'t an account?',
                          clickableText: 'REGISTER',
                        ),
                        AuthProvidersRow(bloc: bloc),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  ButtonStyle loginButtonStyle(BuildContext context) {
    return ButtonStyle(
      elevation: MaterialStateProperty.resolveWith((states) => 1),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) {
          return Theme.of(context).colorScheme.onBackground;
        },
      ),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) {
          return Theme.of(context).colorScheme.background;
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          //side: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
