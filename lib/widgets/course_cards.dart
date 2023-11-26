import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/controllers/database_controller.dart';
import 'package:open_course/db_models/course.dart';
import 'package:open_course/widgets/course_card.dart';

class CourseCards extends StatefulWidget {
  const CourseCards({Key? key}) : super(key: key);

  @override
  State<CourseCards> createState() => _CourseCardsState();
}

class _CourseCardsState extends State<CourseCards> {
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

          return LayoutBuilder(
            builder: (context, constraints) {
              return LayoutGrid(
                columnSizes: [1.fr, 1.fr],
                rowSizes: List.generate(
                    snapshot.data?.docs.length ?? 0, (index) => auto),
                rowGap: 20,
                columnGap: 20,
                children: snapshot.data != null
                    ? snapshot.data!.docs
                        .map((DocumentSnapshot<Course> course) {
                          log("rendering course");
                          return (CourseCard(
                            course: course.data()!,
                          ));
                        })
                        .toList()
                        .cast()
                    : [],
              );
            },
          );
        });
  }
}
