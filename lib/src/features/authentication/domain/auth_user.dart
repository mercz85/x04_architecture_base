import 'auth_mode.dart';
import 'log_status.dart';

class AuthUser {
  String? uid;
  String? userName;
  LogStatus logStatus;
  AuthMode? authMode;
  String? email;
  String? password;

  AuthUser({
    this.uid,
    this.userName,
    required this.logStatus,
    required this.authMode,
    this.email,
    this.password,
  });
}
