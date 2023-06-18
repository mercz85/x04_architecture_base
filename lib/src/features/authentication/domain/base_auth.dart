import 'package:flutter/material.dart';
import 'package:x04_architecture_base/src/features/authentication/domain/auth_mode.dart';
import 'package:x04_architecture_base/src/features/authentication/domain/auth_user.dart';

abstract class BaseAuth {
  //TODO realmente lo que queremos es que devuelva un usuario, no un String
  //TODO quizá se debería quitar lo del email and password y poner solo el Stream
  // y el currentUser para ser independientes del metodo de login
  //NO debería poner aqui TODOS los metodos de login, ya que el dominio debe
  //obligar a ello ***************************
  Stream<AuthUser> get onAuthStateChanged;
  // Future<String> signInWithEmailAndPassword(String email, String password);
  // Future<String> createUserWithEmailAndPassword(String email, String password);
  // Future<AuthUser> register(AuthUser user);
  // Future<AuthUser> signIn(AuthUser user);
  AuthUser? currentUser();

  Future<AuthUser> createUserWithEmailAndPassword(AuthUser user);

  Future<AuthUser> logInWithEmailAndPassword(AuthUser user);
  Future<AuthUser> logInWithGoogle(AuthUser user);
  Future<AuthUser> logInWithApple(AuthUser user);

  Future<AuthUser> signOut(AuthUser user);
}
//TODO LEER ESTO
/*
    https://github.com/jamontes79/fluter_login_example/tree/master/lib
    https://github.com/lazycatlabs/flutter_auth_app/tree/main/lib
    https://medium.com/techloop/building-a-clean-login-ui-in-flutter-9c655df2982a
    https://flutterawesome.com/flutter-auth-app-with-tdd-clean-architecture/
 */
