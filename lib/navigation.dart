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
    double iconContainerHeight = 40;
    double iconContainerWidth = 40;
    double navbarVerticalPadding = 10;
    double navbarHorizontalPadding = 15;
    double iconVerticalPadding = 6;
    double iconHorizontalPadding = 12;
    double iconSize = 30;
    double iconHighlightBorderRadius = 20;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        alignment: Alignment.bottomCenter,
        height: iconContainerHeight +
            navbarVerticalPadding * 2 +
            iconVerticalPadding * 2,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              navbarHorizontalPadding,
              navbarVerticalPadding,
              navbarHorizontalPadding,
              navbarVerticalPadding),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 17, 17, 17),
              borderRadius: BorderRadius.circular(30)),
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => _onItemTapped(0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        iconHorizontalPadding,
                        iconVerticalPadding,
                        iconHorizontalPadding,
                        iconVerticalPadding),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            255, 255, 255, _selectedIndex == 0 ? 0.07 : 0),
                        borderRadius: BorderRadius.circular(iconHighlightBorderRadius)),
                    child: SizedBox(
                      height: iconContainerHeight,
                      width: iconContainerWidth,
                      child: Icon(
                        Icons.home_outlined,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: iconSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _onItemTapped(1),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        iconHorizontalPadding,
                        iconVerticalPadding,
                        iconHorizontalPadding,
                        iconVerticalPadding),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            255, 255, 255, _selectedIndex == 1 ? 0.07 : 0),
                        borderRadius: BorderRadius.circular(iconHighlightBorderRadius)),
                    child: SizedBox(
                      height: iconContainerHeight,
                      width: iconContainerWidth,
                      child: Icon(
                        Icons.class_outlined,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: iconSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        iconHorizontalPadding,
                        iconVerticalPadding,
                        iconHorizontalPadding,
                        iconVerticalPadding),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            255, 255, 255, _selectedIndex == 2 ? 0.07 : 0),
                        borderRadius: BorderRadius.circular(iconHighlightBorderRadius)),
                    child: SizedBox(
                      height: iconContainerHeight,
                      width: iconContainerWidth,
                      child: Icon(
                        Icons.person_outlined,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: iconSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _onItemTapped(3),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        iconHorizontalPadding,
                        iconVerticalPadding,
                        iconHorizontalPadding,
                        iconVerticalPadding),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(
                            255, 255, 255, _selectedIndex == 3 ? 0.07 : 0),
                        borderRadius: BorderRadius.circular(iconHighlightBorderRadius)),
                    child: SizedBox(
                      height: iconContainerHeight,
                      width: iconContainerWidth,
                      child: Icon(
                        Icons.settings_outlined,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: iconSize,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
