import 'dart:developer';

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
        backgroundColor: const Color(0xff171717),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff171717),
          toolbarHeight: 100,
          flexibleSpace: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff1F6DEE),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () => log("Create course"),
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xff111111),
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          currentIndex: _selectedIndex,
          onTap: (value) => _onItemTapped(value),
          selectedItemColor: const Color(0xFFFFFFFF),
          unselectedItemColor: const Color.fromARGB(69, 255, 255, 255),
          backgroundColor: const Color(0xFF111111),
          type: BottomNavigationBarType.fixed,
          items: const [
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
