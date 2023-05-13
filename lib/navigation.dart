import 'package:flutter/material.dart';
import 'package:open_course/pages/courses.dart';
import 'package:open_course/pages/home.dart';
import 'package:open_course/pages/profile.dart';
import 'package:open_course/pages/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Home(),
    Courses(),
    Profile(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) => _onItemTapped(value),
          selectedItemColor: Color(0xFFFFFFFF),
          unselectedItemColor: Color.fromARGB(69, 255, 255, 255),
          backgroundColor: Color(0xFF111111),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.class_outlined), label: "Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ],
        ));
  }
}
