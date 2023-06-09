import 'package:flutter/material.dart';
import 'package:open_course/widgets/course_card_large.dart';
import 'package:open_course/widgets/page_scaffold.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(children: const [
      CourseCardLarge(),
      CourseCardLarge(),
      CourseCardLarge(),
      CourseCardLarge(),
      CourseCardLarge(),
    ]);
  }
}
