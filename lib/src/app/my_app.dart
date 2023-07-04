import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:x04_architecture_base/src/app/app.dart';
import '../common/common.dart';
import '../features/authentication/authentication.dart';
import 'my_app_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bloc = MyAppBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO 2 create toogle button to DARKMODE & save in sharedPrefs
    return StreamBuilder<bool>(
        stream: bloc.streamDark,
        initialData: false,
        builder: (context, snapshot) {
          final isDark = snapshot.data!;
          //rebuilds ThemeInheritedWidget when stream emmits value
          return ThemeInheritedWidget(
            isThemeDark: isDark,
            onThemeChanged: (isDark) {
              bloc.onThemeChanged(isDark);
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Material App',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: isDark
                  ? AppTheme.darkTheme
                  : AppTheme
                      .lightTheme, //AppTheme.lightThemeFromSeed, //ThemeData.light()
              //TODO 1 if the user isnt logged, open register/login
              //TODO add here a inheritedWidget to know if user is logged
              //and  set home
              home: const LoginScreen(),
              //home: const MyAppBase(),
            ),
          );
        });
  }
}
