import 'package:flutter/widgets.dart';

class UserInheritedWidget extends InheritedWidget {
  const UserInheritedWidget({
    required Widget child,
    required this.isUserLogged,
    required this.userUid,
    Key? key,
  }) : super(child: child, key: key);

  final bool isUserLogged;
  final String userUid;

  static UserInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>()!;

  @override
  bool updateShouldNotify(covariant UserInheritedWidget oldWidget) {
    if (oldWidget.isUserLogged != isUserLogged) return true;
    //if (oldWidget.userUid != userUid) return true;

    return false;
  }
}
