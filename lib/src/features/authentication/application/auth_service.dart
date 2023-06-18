//TODO create service to fetch data from repository
//implementing abstract class located in bloc (or domain?)

//https://medium.com/dartlang/dart-asynchronous-programming-streams-dab952023ed7

import 'dart:async';
import '../data/data.dart';
import '../domain/domain.dart';

class AuthService implements BaseAuth {
  late final BaseAuth _baseAuth;

  AuthService() {
    _baseAuth = MockAuthRepository();
  }

  // TODO: implement methods using these repositories
  // *Here would choose mock or real / or local vs cloud
  // *in this case it just calls the repo method depending on AuthMode
  @override
  AuthUser? currentUser() {
    return _baseAuth.currentUser();
  }

  @override
  Stream<AuthUser> get onAuthStateChanged => _baseAuth.onAuthStateChanged;

  @override
  Future<AuthUser> signOut(AuthUser user) {
    return _baseAuth.signOut(user);
  }
  
  @override
  Future<AuthUser> createUserWithEmailAndPassword(AuthUser user) {
    return _baseAuth.createUserWithEmailAndPassword(user);

  }
  
  @override
  Future<AuthUser> logInWithApple(AuthUser user) {
    return _baseAuth.logInWithApple(user);
  }
  
  @override
  Future<AuthUser> logInWithEmailAndPassword(AuthUser user) {
    return _baseAuth.logInWithEmailAndPassword(user);

  }
  
  @override
  Future<AuthUser> logInWithGoogle(AuthUser user) {
    return _baseAuth.logInWithGoogle(user);

  }
}
