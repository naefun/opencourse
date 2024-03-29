import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_course/widgets/completed_course_graph.dart';
import 'package:open_course/widgets/course_cards.dart';
import 'package:open_course/widgets/page_scaffold.dart';
import 'package:open_course/widgets/resume_course_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      children: [
        const Text(
          "Pick up where you left off",
          style: TextStyle(
              color: Color(0xFFFFA500),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        const ResumeCourseCard(),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "Completed courses",
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const CompletedCoursesLineGraph(),
        const SizedBox(
          height: 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Your courses",
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => log("See all courses"),
              child: const Text("See all",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 14,
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const CourseCards(),
      ],
    );
  }
}
