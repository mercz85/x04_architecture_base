import 'dart:async';

import '../domain/domain.dart';

class MockAuthRepository implements BaseAuth {
  late AuthUser _authUser;

  MockAuthRepository() {
    _authUser = AuthUser(logStatus: LogStatus.loggedOut, authMode: null);
  }

  @override
  AuthUser? currentUser() {
    return _authUser;
  }

  @override
  Stream<AuthUser> get onAuthStateChanged => authStateModified();

  Stream<AuthUser> authStateModified() async* {
    _authUser.logStatus = _authUser.logStatus == LogStatus.loggedIn
        ? LogStatus.loggedOut
        : LogStatus.loggedIn;
    // for (var i = 0; i < 10; i++) {
    //   print("SENT _authUser no. $i");
    //   if (i > 3 && _authUser.logStatus == LogStatus.loggedOut) {
    //     _authUser.logStatus = LogStatus.loggedIn;
    //   }
    //   await Future.delayed(const Duration(seconds: 2));
    //yield _authUser;
    //}
    await Future.delayed(const Duration(seconds: 3));
    yield _authUser;
  }

  @override
  Future<AuthUser> signOut(AuthUser user) async {
    _authUser.uid = "";
    _authUser.userName = "";
    _authUser.authMode = null;
    _authUser.logStatus = LogStatus.loggedOut;
    _authUser.password = "";
    _authUser.email = "";
    await Future.delayed(const Duration(seconds: 3));
    return Future<AuthUser>.value(_authUser);
  }

  @override
  Future<AuthUser> createUserWithEmailAndPassword(AuthUser user) async {
    _authUser.uid = "uid";
    _authUser.userName = "userName";
    _authUser.authMode = AuthMode.emailAndPassword;
    _authUser.logStatus = LogStatus.loggedIn;
    _authUser.password = user.password;
    _authUser.email = user.email;

    await Future.delayed(const Duration(seconds: 3));
    return Future<AuthUser>.value(_authUser);
  }

  @override
  Future<AuthUser> logInWithEmailAndPassword(AuthUser user) async {
    _authUser.uid = "uid";
    _authUser.userName = "userName";
    _authUser.authMode = AuthMode.emailAndPassword;
    _authUser.logStatus = LogStatus.loggedIn;
    _authUser.password = user.password;
    _authUser.email = user.email;
    await Future.delayed(const Duration(seconds: 3));
    return Future<AuthUser>.value(_authUser);
  }

  @override
  Future<AuthUser> logInWithApple(AuthUser user) async {
    _authUser.uid = "uid";
    _authUser.userName = "userName";
    _authUser.authMode = AuthMode.apple;
    _authUser.logStatus = LogStatus.loggedIn;
    _authUser.password = user.password;
    _authUser.email = user.email;
    await Future.delayed(const Duration(seconds: 3));
    return Future<AuthUser>.value(_authUser);
  }

  @override
  Future<AuthUser> logInWithGoogle(AuthUser user) async {
    _authUser.uid = "uid";
    _authUser.userName = "userName";
    _authUser.authMode = AuthMode.google;
    _authUser.logStatus = LogStatus.loggedIn;
    _authUser.password = user.password;
    _authUser.email = user.email;
    await Future.delayed(const Duration(seconds: 3));
    return Future<AuthUser>.value(_authUser);
  }

  // @override
  // Future<AuthUser> register(AuthUser user) {
  //   _authUser.uid = "uid";
  //   _authUser.userName = "userName";
  //   _authUser.authMode = AuthMode.emailAndPassword;
  //   _authUser.logStatus = LogStatus.loggedIn;
  //   _authUser.password = user.password;
  //   _authUser.email = user.email;
  //   return Future<AuthUser>.value(_authUser);
  // }

  // @override
  // Future<AuthUser> signIn(AuthUser user) {
  //   _authUser.uid = "uid";
  //   _authUser.userName = "userName";
  //   _authUser.authMode = AuthMode.emailAndPassword;
  //   _authUser.logStatus = LogStatus.loggedIn;
  //   _authUser.password = user.password;
  //   _authUser.email = user.email;
  //   return Future<AuthUser>.value(_authUser);
  // }
}
