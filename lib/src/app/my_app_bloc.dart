import 'dart:async';

class MyAppBloc {
  final _controllerDark = StreamController<bool>();
  Stream<bool> get streamDark => _controllerDark.stream;

  void onThemeChanged(bool isDark) {
    _controllerDark.add(isDark);
  }

  void dispose() {
    _controllerDark.close();
  }
}
