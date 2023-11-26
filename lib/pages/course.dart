import 'package:flutter/material.dart';
import 'package:open_course/db_models/course.dart';
import 'package:open_course/widgets/course_metrics.dart';
import 'package:open_course/widgets/course_tag.dart';
import 'package:open_course/widgets/lesson_dropdown_selector.dart';
import 'package:open_course/widgets/lesson_progression.dart';
import 'package:open_course/widgets/page_scaffold.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key, required this.course});

  final Course course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      includeAppBar: true,
      appBarHeading: "Course",
      includeAppBarButton: false,
      children: [
        const Text(
          "Flutter for beginners",
          style: TextStyle(
              fontSize: 30,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Learn how to create cross platform apps using flutter."),
        const SizedBox(
          height: 30,
        ),
        const Wrap(
          spacing: 10,
          children: [
            CourseTag(
              text: "Web",
              color: Color(0xffFCAFAF),
            ),
            CourseTag(
              text: "Front-end",
              color: Color(0xffE8FACC),
            ),
            CourseTag(
              text: "JavaScript",
              color: Color(0xffCFFFF9),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        const CourseMetrics(),
        const SizedBox(
          height: 20,
        ),
        const LessonProgression(),
        const SizedBox(
          height: 60,
        ),
        const LessonDropdownSelector(),
        const LessonDropdownSelector(),
        const LessonDropdownSelector(),
        Center(
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff49C29D),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.add,
              color: Color(0xff49C29D),
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
