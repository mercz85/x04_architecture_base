import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

class AppTheme {
  // static final Color _iconColor = Colors.blueAccent.shade200;
  // static const Color _lightPrimaryColor = Color(0xFF546E7A);
  // static const Color _lightPrimaryVariantColor = Color(0xFF546E7A);
  // static const Color _lightSecondaryColor = Colors.green;
  // static const Color _lightOnPrimaryColor = Colors.black;

  // static const Color _darkPrimaryColor = Colors.white24;
  // static const Color _darkPrimaryVariantColor = Colors.black;
  // static const Color _darkSecondaryColor = Colors.white;
  // static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    // appBarTheme: const AppBarTheme(
    //   titleTextStyle: TextStyle(
    //       color: _darkSecondaryColor,
    //       fontFamily: "Roboto",
    //       fontWeight: FontWeight.bold,
    //       fontSize: 26),
    //   color: _lightPrimaryVariantColor,
    //   iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    // ),
    useMaterial3: true,
    colorScheme: lightColorScheme,
    // iconTheme: IconThemeData(
    //   color: _iconColor,
    // ),
    // textTheme: _lightTextTheme,
    // dividerTheme: const DividerThemeData(
    //   color: Colors.black12,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColorScheme.onBackground.withOpacity(0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: lightColorScheme.onBackground.withOpacity(0.3),
        ),
      ),
      fillColor: lightColorScheme.onPrimary,
      filled: true,
      hintStyle: TextStyle(
        color: lightColorScheme.onBackground.withOpacity(0.5),
        fontSize: 14,
      ),
      prefixIconColor: lightColorScheme.onBackground.withOpacity(0.5),
    ),
    dividerTheme: DividerThemeData(
      thickness: 0.5,
      color: lightColorScheme.onBackground.withOpacity(0.4),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: _darkPrimaryVariantColor,
    // appBarTheme: const AppBarTheme(
    //   titleTextStyle: TextStyle(
    //       color: _darkSecondaryColor,
    //       //fontFamily: "Roboto",
    //       fontWeight: FontWeight.bold,
    //       fontSize: 26),
    //   color: _darkPrimaryVariantColor,
    //   iconTheme: IconThemeData(color: _darkOnPrimaryColor),
    // ),
    useMaterial3: true,
    colorScheme: darkColorScheme,
    // iconTheme: IconThemeData(
    //   color: _iconColor,
    // ),
    // textTheme: _darkTextTheme,
    // dividerTheme: const DividerThemeData(
    //   color: Colors.black,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkColorScheme.onBackground.withOpacity(0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkColorScheme.onBackground.withOpacity(0.3),
        ),
      ),
      fillColor: darkColorScheme.onPrimary.withOpacity(0.05),
      filled: true,
      hintStyle: TextStyle(
        color: darkColorScheme.onBackground.withOpacity(0.5),
        fontSize: 14,
      ),
      prefixIconColor: darkColorScheme.onBackground.withOpacity(0.5),
    ),
    dividerTheme: DividerThemeData(
      thickness: 0.5,
      color: darkColorScheme.onBackground.withOpacity(0.4),
    ),
  );

  // static final TextTheme _lightTextTheme = TextTheme(
  //   displayLarge: _lightScreenHeading1TextStyle,
  // );

  // static final TextTheme _darkTextTheme = TextTheme(
  //   displayLarge: _darkScreenHeading1TextStyle,
  // );

  // static const TextStyle _lightScreenHeading1TextStyle = TextStyle(
  //   fontSize: 26.0,
  //   fontWeight: FontWeight.bold,
  //   color: _lightOnPrimaryColor,
  //   //fontFamily: "Roboto",
  // );

  // static final TextStyle _darkScreenHeading1TextStyle =
  //     _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);
}


// class _AppThemeExampleWithoutCompleteScheme {
//   static final Color _iconColor = Colors.blueAccent.shade200;
//   static const Color _lightPrimaryColor = Color(0xFF546E7A);
//   static const Color _lightPrimaryVariantColor = Color(0xFF546E7A);
//   static const Color _lightSecondaryColor = Colors.green;
//   static const Color _lightOnPrimaryColor = Colors.black;

//   static const Color _darkPrimaryColor = Colors.white24;
//   static const Color _darkPrimaryVariantColor = Colors.black;
//   static const Color _darkSecondaryColor = Colors.white;
//   static const Color _darkOnPrimaryColor = Colors.white;

//   static final ThemeData lightTheme = ThemeData(
//       appBarTheme: const AppBarTheme(
//         titleTextStyle: TextStyle(
//             color: _darkSecondaryColor,
//             fontFamily: "Roboto",
//             fontWeight: FontWeight.bold,
//             fontSize: 26),
//         color: _lightPrimaryVariantColor,
//         iconTheme: IconThemeData(color: _lightOnPrimaryColor),
//       ),
//       colorScheme: const ColorScheme.light(
//         primary: _lightPrimaryColor,
//         primaryContainer: _lightPrimaryVariantColor,
//         secondary: _lightSecondaryColor,
//         onPrimary: _lightOnPrimaryColor,
//       ),
//       iconTheme: IconThemeData(
//         color: _iconColor,
//       ),
//       textTheme: _lightTextTheme,
//       dividerTheme: const DividerThemeData(color: Colors.black12));

//   static final ThemeData darkTheme = ThemeData(
//       scaffoldBackgroundColor: _darkPrimaryVariantColor,
//       appBarTheme: const AppBarTheme(
//         color: _darkPrimaryVariantColor,
//         iconTheme: IconThemeData(color: _darkOnPrimaryColor),
//       ),
//       colorScheme: const ColorScheme.dark(
//         primary: _darkPrimaryColor,
//         primaryContainer: _darkPrimaryVariantColor,
//         secondary: _darkSecondaryColor,
//         onPrimary: _darkOnPrimaryColor,
//         background: Colors.white12,
//       ),
//       iconTheme: IconThemeData(
//         color: _iconColor,
//       ),
//       textTheme: _darkTextTheme,
//       dividerTheme: const DividerThemeData(color: Colors.black));

//   static final TextTheme _lightTextTheme = TextTheme(
//     displayLarge: _lightScreenHeading1TextStyle,
//   );

//   static final TextTheme _darkTextTheme = TextTheme(
//     displayLarge: _darkScreenHeading1TextStyle,
//   );

//   static const TextStyle _lightScreenHeading1TextStyle = TextStyle(
//     fontSize: 26.0,
//     fontWeight: FontWeight.bold,
//     color: _lightOnPrimaryColor,
//     fontFamily: "Roboto",
//   );

//   static final TextStyle _darkScreenHeading1TextStyle =
//       _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);
// }
