import 'package:flutter/material.dart';

import '../app.dart';

class MyAppBase extends StatefulWidget {
  const MyAppBase({Key? key}) : super(key: key);

  @override
  State<MyAppBase> createState() => _MyAppBaseState();
}

class _MyAppBaseState extends State<MyAppBase> {
  int _currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void _onItemTapped(int index) {
    index == 4
        ? _scaffoldKey.currentState?.openDrawer()
        : setState(() {
            _currentPageIndex = index;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          // setState(() {
          //   currentPageIndex = index;
          // });
          _onItemTapped(index);
        },
        selectedIndex: _currentPageIndex,
        destinations: navigationDestinations,
      ),
      body: destinationWidgets[_currentPageIndex],
    );
  }

  List<Widget> get navigationDestinations {
    return const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(Icons.sentiment_satisfied_alt),
        icon: Icon(Icons.sentiment_satisfied_alt),
        label: 'You',
      ),
      NavigationDestination(
        icon: Icon(Icons.explore),
        label: 'Explore',
      ),
      NavigationDestination(
        icon: Icon(Icons.commute),
        label: 'Commute',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.bookmark),
        icon: Icon(Icons.bookmark_border),
        label: 'Saved',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.settings),
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ];
  }

  List<Widget> get destinationWidgets {
    return <Widget>[
      Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text('Page 1'),
      ),
      Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text('Page 2'),
      ),
      Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('Page 3'),
      ),
      Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: const Text('Page 4'),
      ),
      //const DrawerScreen(),
    ];
  }
}
