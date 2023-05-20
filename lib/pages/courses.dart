import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/widgets/course_card_large.dart';
import 'package:open_course/widgets/create_course_form.dart';
import 'package:open_course/widgets/percent_progress_bar.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff171717),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CourseCardLarge(),
                CourseCardLarge(),
                CourseCardLarge(),
                CourseCardLarge(),
                CourseCardLarge(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
