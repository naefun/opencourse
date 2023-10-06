import 'package:flutter/material.dart';
import 'package:open_course/navigation.dart';
import 'package:open_course/pages/course.dart';
import 'package:open_course/pages/logged_out_pages/landing.dart';
import 'package:open_course/pages/lesson.dart';

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

  static void pushLessonPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LessonPage(),
      ),
    );
  }

  static void pushCoursePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CoursePage(),
      ),
    );
  }
}
