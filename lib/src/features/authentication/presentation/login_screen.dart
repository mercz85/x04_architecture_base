import 'package:flutter/material.dart';

import '../authentication.dart';
import '../domain/domain.dart';
import '../presentation/login_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = LoginBloc();
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
    return GestureDetector(
      //Hide keyboard on tap outside textfield
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
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          EmailTextFormField(
                            key: const Key('emailLoginTextFormField'),
                            onSaved: (newValue) => _authUser.email = newValue,
                          ),
                          PasswordTextFormField(
                            key: const Key('passwordLoginTextFormField'),
                            onSaved: (newValue) =>
                                _authUser.password = newValue,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: TextButton(
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.resolveWith(
                                      (states) => 4),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.green[400]!)),
                              onPressed: () async => validateAndSubmit(),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          StreamBuilder<Object>(
                              stream: bloc.authUserStream,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final data = snapshot.data! as AuthUser;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: TextButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.resolveWith(
                                                  (states) => 4),
                                          backgroundColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      Colors.green[400]!)),
                                      onPressed: () async {
                                        await bloc.loginWithEmailAndPassword(
                                            _authUser.email!,
                                            _authUser.password!);
                                      },
                                      child: Text(
                                        'BORRAR ${data.authMode}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                    NavigateToScreenTxtBtn(
                      onPressed: () => navigateToRegisterScreen(context),
                      text: 'Haven\'t an account? Create one',
                    ),
                  ],
                ),
                AuthProvidersColumn(bloc: bloc)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Size measureWidget(Widget widget) {
  //   final PipelineOwner pipelineOwner = PipelineOwner();
  //   final MeasurementView rootView = pipelineOwner.rootNode = MeasurementView();
  //   final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
  //   final RenderObjectToWidgetElement<RenderBox> element =
  //       RenderObjectToWidgetAdapter<RenderBox>(
  //     container: rootView,
  //     debugShortDescription: '[root]',
  //     child: widget,
  //   ).attachToRenderTree(buildOwner);
  //   try {
  //     rootView.scheduleInitialLayout();
  //     pipelineOwner.flushLayout();
  //     return rootView.size;
  //   } finally {
  //     // Clean up.
  //     element
  //         .update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
  //     buildOwner.finalizeTree();
  //   }
  // }
}

// Size measureWidget2(Widget widget) {
//   final PipelineOwner pipelineOwner = PipelineOwner();
//   final MeasurementView rootView = pipelineOwner.rootNode = MeasurementView();
//   final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
//   final RenderObjectToWidgetElement<RenderBox> element =
//       RenderObjectToWidgetAdapter<RenderBox>(
//     container: rootView,
//     debugShortDescription: '[root]',
//     child: widget,
//   ).attachToRenderTree(buildOwner);
//   try {
//     rootView.scheduleInitialLayout();
//     pipelineOwner.flushLayout();
//     return rootView.size;
//   } finally {
//     // Clean up.
//     element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
//     buildOwner.finalizeTree();
//   }
// }

// class MeasurementView extends RenderBox
//     with RenderObjectWithChildMixin<RenderBox> {
//   @override
//   void performLayout() {
//     assert(child != null);
//     child!.layout(const BoxConstraints(), parentUsesSize: true);
//     size = child!.size;
//   }

//   @override
//   void debugAssertDoesMeetConstraints() => true;
// }
