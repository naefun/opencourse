import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_course/db_models/course.dart';

class DatabaseController {
  static FirebaseFirestore getDb() {
    return FirebaseFirestore.instance;
  }

  static Stream<QuerySnapshot<Course>> getCourseStream() {
    return DatabaseController.getDb()
        .collection("courses")
        .withConverter(
            fromFirestore: Course.fromFirestore,
            toFirestore: (Course course, _) => course.toFirestore())
        .snapshots();
  }

  static void createCourse(String title, String description) {
    getDb().collection("courses").add(<String, dynamic>{
      "title": title,
      "description": description,
      "units": [],
    }).then((value) => log('Document added with ID: ${value.id}'));
  }
}
