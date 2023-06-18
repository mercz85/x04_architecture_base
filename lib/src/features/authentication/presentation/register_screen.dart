import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../presentation/presentation.dart';
import '../domain/domain.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final bloc = RegisterBloc();
  final AuthUser _authUser =
      AuthUser(logStatus: LogStatus.loggedOut, authMode: null);

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTitle(),
                Container(
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              key: const Key('emailRegisterTextFormField'),
                              decoration: const InputDecoration(
                                labelText: 'Enter your email',
                                icon: Icon(FontAwesomeIcons.envelope),
                              ),
                              onSaved: (newValue) {
                                _authUser.email = newValue;
                              },
                            ),
                            TextFormField(
                              key: const Key('passwordRegisterTextFormField'),
                              decoration: const InputDecoration(
                                labelText: 'Enter a password',
                                icon: Icon(FontAwesomeIcons.lock),
                              ),
                              onSaved: (newValue) {
                                _authUser.password = newValue;
                              },
                              obscureText: true,
                            ),
                            TextFormField(
                              key: const Key(
                                  'passwordRepeatedRegisterTextFormField'),
                              decoration: const InputDecoration(
                                labelText: 'Repeat your password',
                                icon: Icon(FontAwesomeIcons.lock),
                              ),
                              onSaved: (newValue) {
                                _authUser.password = newValue;
                              },
                              obscureText: true,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: TextButton(
                                style: ButtonStyle(
                                    elevation:
                                        MaterialStateProperty.resolveWith(
                                            (states) => 4),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.green[400]!)),
                                onPressed: () async {
                                  await bloc.createUserWithEmailAndPassword(
                                      _authUser.email!, _authUser.password!);
                                },
                                child: const Text(
                                  'REGISTER',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Have an account? Login',
                          style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
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
                            onPressed: () async {
                              await bloc.loginWithGoogle();
                            },
                          ),
                        ),
                        Expanded(
                          child: AppleFAB(
                            onPressed: () async {
                              await bloc.loginWithApple();
                            },
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
