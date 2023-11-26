import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:open_course/controllers/database_controller.dart';
import 'package:open_course/db_models/course.dart';
import 'package:open_course/widgets/course_card_large.dart';

class CourseCardsLarge extends StatefulWidget {
  const CourseCardsLarge({Key? key}) : super(key: key);

  @override
  State<CourseCardsLarge> createState() => _CourseCardsLargeState();
}

class _CourseCardsLargeState extends State<CourseCardsLarge> {
  final Stream<QuerySnapshot<Course>> courseStream =
      DatabaseController.getCourseStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Course>>(
      stream: courseStream,
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Course>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return _buildCourseCards(snapshot.data!);
      },
    );
  }

  Widget _buildCourseCards(QuerySnapshot<Course> snapshot) {
    return Flex(
      direction: Axis.vertical,
      children: snapshot.docs.map((DocumentSnapshot<Course> course) {
        log("rendering course");
        return (CourseCardLarge(
          course: course.data()!,
        ));
      }).toList(),
    );
  }
}
