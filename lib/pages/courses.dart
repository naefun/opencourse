import 'package:flutter/material.dart';
import 'package:open_course/widgets/course_cards_large.dart';
import 'package:open_course/widgets/page_scaffold.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return const PageScaffold(children: [CourseCardsLarge()]);
  }
}
