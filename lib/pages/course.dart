import 'package:flutter/material.dart';
import 'package:open_course/widgets/page_scaffold.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      includeAppBar: true,
      appBarHeading: "Course name",
      includeAppBarButton: false,
      children: const [
        Placeholder(),
      ],
    );
  }
}
