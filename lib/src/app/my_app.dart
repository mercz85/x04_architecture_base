import 'package:flutter/material.dart';
import '../features/authentication/authentication.dart';

//TODO 1 add bottombarnavigation

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO 1 if the user isnt logged, open register/login
    return MaterialApp(
      title: 'Material App',
      home: LoginScreen(),
    );
  }
}

class MyAppBase extends StatelessWidget {
  const MyAppBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}
