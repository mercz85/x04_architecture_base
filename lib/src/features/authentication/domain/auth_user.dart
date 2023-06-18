// ignore_for_file: public_member_api_docs, sort_constructors_first
//TODO create User model
import 'package:x04_architecture_base/src/features/authentication/domain/auth_mode.dart';

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
