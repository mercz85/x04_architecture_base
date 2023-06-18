import '../domain/domain.dart';
//https://github.com/felangel/bloc/blob/master/examples/flutter_firebase_login/packages/authentication_repository/lib/src/authentication_repository.dart

class FirebaseAuthRepository implements BaseAuth {
  late AuthUser _authUser;

  FirebaseAuthRepository() {
    _authUser = AuthUser(logStatus: LogStatus.loggedOut, authMode: null);
  }

  @override
  AuthUser? currentUser() {
    return _authUser;
  }

  @override
  // TODO: implement onAuthStateChanged
  Stream<AuthUser> get onAuthStateChanged => throw UnimplementedError();

  @override
  Future<AuthUser> signOut(AuthUser user) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> createUserWithEmailAndPassword(AuthUser user) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> logInWithEmailAndPassword(AuthUser user) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> logInWithApple(AuthUser user) {
    // TODO: implement logInWithApple
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> logInWithGoogle(AuthUser user) {
    // TODO: implement logInWithGoogle
    throw UnimplementedError();
  }
}
