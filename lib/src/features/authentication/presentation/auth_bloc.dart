import 'dart:async';

import '../application/auth_service.dart';
import '../domain/domain.dart';

class AuthBloc {
//CONSTANTS
  static const String enterPassword = 'Enter a password.';
  static const String confirmPassword = 'Confirm your password.';

  final _controller = StreamController<AuthUser>();
  Stream<AuthUser> get authUserStream => _controller.stream;

  final AuthService _authService = AuthService();

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    AuthUser loggedUser = await _authService.createUserWithEmailAndPassword(
      AuthUser(
        logStatus: LogStatus.loggedOut,
        authMode: AuthMode.emailAndPassword,
        email: email,
        password: password,
      ),
    );
    _controller.add(loggedUser);
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    AuthUser loggedUser = await _authService.logInWithEmailAndPassword(
      AuthUser(
        logStatus: LogStatus.loggedOut,
        authMode: AuthMode.emailAndPassword,
        email: email,
        password: password,
      ),
    );
    _controller.add(loggedUser);
  }

  Future<void> loginWithGoogle() async {
    AuthUser loggedUser = await _authService.logInWithGoogle(
      AuthUser(
        logStatus: LogStatus.loggedOut,
        authMode: AuthMode.google,
      ),
    );
    _controller.add(loggedUser);
  }

  Future<void> loginWithApple() async {
    AuthUser loggedUser = await _authService.logInWithApple(
      AuthUser(
        logStatus: LogStatus.loggedOut,
        authMode: AuthMode.apple,
      ),
    );
    _controller.add(loggedUser);
  }

  void dispose() {
    _controller.close();
  }
}
