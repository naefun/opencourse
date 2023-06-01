import 'package:flutter/material.dart';
import 'package:open_course/navigation.dart';
import 'package:open_course/pages/landing.dart';

class NavigatorHandler {
  static void pushReplaceNavigation(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Navigation(),
      ),
    );
  }

  static void pushReplaceLandingPage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LandingPage(),
      ),
    );
  }
}
