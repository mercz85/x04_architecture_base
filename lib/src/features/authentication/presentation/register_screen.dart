import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../app/app.dart';
import '../presentation/presentation.dart';
import '../domain/domain.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        await bloc.createUserWithEmailAndPassword(
          _authUser.email!,
          _authUser.password!,
        );
        //TODO sendEmailVerification Firebase
        //await bloc.sendEmailVerification(userCredential.user);
      }
    }
  }

  void navigateToLoginScreen(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
  //     child: Scaffold(
  //       resizeToAvoidBottomInset: false,
  //       body: SafeArea(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               AppTitle(),
  //               Container(
  //                 child: Column(
  //                   children: [
  //                     Form(
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.stretch,
  //                         children: [
  //                           TextFormField(
  //                             key: const Key('emailRegisterTextFormField'),
  //                             decoration: const InputDecoration(
  //                               labelText: 'Enter your email',
  //                               icon: Icon(FontAwesomeIcons.envelope),
  //                             ),
  //                             onSaved: (newValue) {
  //                               _authUser.email = newValue;
  //                             },
  //                           ),
  //                           TextFormField(
  //                             key: const Key('passwordRegisterTextFormField'),
  //                             decoration: const InputDecoration(
  //                               labelText: 'Enter a password',
  //                               icon: Icon(FontAwesomeIcons.lock),
  //                             ),
  //                             onSaved: (newValue) {
  //                               _authUser.password = newValue;
  //                             },
  //                             obscureText: true,
  //                           ),
  //                           TextFormField(
  //                             key: const Key(
  //                                 'passwordRepeatedRegisterTextFormField'),
  //                             decoration: const InputDecoration(
  //                               labelText: 'Repeat your password',
  //                               icon: Icon(FontAwesomeIcons.lock),
  //                             ),
  //                             onSaved: (newValue) {
  //                               _authUser.password = newValue;
  //                             },
  //                             obscureText: true,
  //                           ),
  //                           Padding(
  //                             padding:
  //                                 const EdgeInsets.symmetric(vertical: 12.0),
  //                             child: TextButton(
  //                               style: ButtonStyle(
  //                                   elevation:
  //                                       MaterialStateProperty.resolveWith(
  //                                           (states) => 4),
  //                                   backgroundColor:
  //                                       MaterialStateColor.resolveWith(
  //                                           (states) => Colors.green[400]!)),
  //                               onPressed: () async {
  //                                 await bloc.createUserWithEmailAndPassword(
  //                                     _authUser.email!, _authUser.password!);
  //                               },
  //                               child: const Text(
  //                                 'REGISTER',
  //                                 style: TextStyle(fontSize: 20),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     TextButton(
  //                       onPressed: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (context) => const LoginScreen()),
  //                         );
  //                       },
  //                       child: const Text(
  //                         'Have an account? Login',
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           decoration: TextDecoration.underline,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Column(
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.symmetric(vertical: 20),
  //                     child: Text(
  //                       'Or sign in with:',
  //                     ),
  //                   ),
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Expanded(child: Container()),
  //                       Expanded(
  //                         flex: 1,
  //                         child: GoogleFAB(
  //                           onPressed: () async {
  //                             await bloc.loginWithGoogle();
  //                           },
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: AppleFAB(
  //                           onPressed: () async {
  //                             await bloc.loginWithApple();
  //                           },
  //                         ),
  //                       ),
  //                       Expanded(child: Container()),
  //                     ],
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String confirmPasword = '';

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
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppTitle(
                          text: 'Sign up!',
                        ),
                        Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  EmailTextFormField(
                                    key:
                                        const Key('emailRegisterTextFormField'),
                                    onSaved: (newValue) =>
                                        _authUser.email = newValue,
                                  ),
                                  const SizedBox(height: 10),
                                  PasswordTextFormField(
                                    key: const Key(
                                        'passwordRegisterTextFormField'),
                                    onSaved: (newValue) {
                                      _authUser.password = newValue;
                                      confirmPasword = newValue.toString();
                                    },
                                    text: AuthBloc.enterPassword,
                                  ),
                                  const SizedBox(height: 10),
                                  PasswordTextFormField(
                                    key: const Key(
                                        'confirmPasswordRegisterTextFormField'),
                                    text: AuthBloc.confirmPassword,
                                    getConfirmPasswordValue: () {
                                      return confirmPasword;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: TextButton(
                                      style: registerButtonStyle(context),
                                      onPressed: () async =>
                                          validateAndSubmit(),
                                      child: const SignInButtonText(
                                          text: 'Register'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            NavigateToScreenTxtBtn(
                              onPressed: () => navigateToLoginScreen(context),
                              text: 'Have an account?',
                              clickableText: 'LOGIN',
                            ),
                          ],
                        ),
                        AuthProvidersRow(bloc: bloc)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }

  ButtonStyle registerButtonStyle(BuildContext context) {
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
