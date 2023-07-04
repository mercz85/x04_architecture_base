import 'package:flutter/material.dart';

class ThemeInheritedWidget extends InheritedWidget {
  const ThemeInheritedWidget({
    required Widget child,
    required this.onThemeChanged,
    required this.isThemeDark,
    Key? key,
  }) : super(child: child, key: key);

  final ValueChanged<bool> onThemeChanged;
  final bool isThemeDark;

  void updateTheme(bool isDark) {
    onThemeChanged(isDark);
  }

  static ThemeInheritedWidget of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<ThemeInheritedWidget>()!;

  @override
  bool updateShouldNotify(covariant ThemeInheritedWidget oldWidget) =>
      oldWidget.isThemeDark != isThemeDark;
}
