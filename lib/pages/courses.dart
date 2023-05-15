import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_course/widgets/create_course_form.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CreateCourseForm(function: (value)=>log("callback")),
      ),
    );
  }
}
