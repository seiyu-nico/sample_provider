import 'package:flutter/material.dart';

import 'package:sample_provider/screens/todo_use_provider_screen.dart';
import 'package:sample_provider/screens/todo_not_use_provider_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final _pageWidgets = [
    TodoUseProviderScreen(),
    TodoNotUseProviderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.backpack,
            ),
            label: 'Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.no_backpack,
            ),
            label: 'NoProvider',
          ),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
