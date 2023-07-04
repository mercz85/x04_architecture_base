import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'drawer_bloc.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final bloc = DrawerBloc();

  void _navigateTo(Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => widget,
      ),
    );
  }

  @override
  void initState() {
    bloc.streamPages.listen((event) {
      if (event == Pages.page1) {
        _navigateTo(const Page1());
      } else if (event == Pages.page2) {
        _navigateTo(const Page2());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context
        .dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>()!
        .isThemeDark;
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  'Username',
                  style: TextStyle(color: Colors.grey),
                ),
                accountEmail: Text('Milo Max'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/sirena.png'),
                ),
              ),
              SwitchListTile(
                value: isDark,
                title: const Text('Dark Theme'),
                onChanged: (val) {
                  ThemeInheritedWidget.of(context).updateTheme(val);
                },
              ),
              ListTile(
                tileColor: Colors.blueGrey,
                title: const Text('Go to Page 1'),
                onTap: () {
                  bloc.navigateToPage(Pages.page1);
                },
              ),
              const SizedBox(height: 2),
              ListTile(
                tileColor: Colors.blueGrey,
                title: const Text('Go to Page 2'),
                onTap: () {
                  bloc.navigateToPage(Pages.page2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}
