import 'package:flutter/material.dart';
import 'package:open_course/widgets/course_card_large.dart';
import 'package:open_course/widgets/page_scaffold.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
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
