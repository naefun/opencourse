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

  static Future<Course?> createCourse(String title, String description) async {
    Course? createdCourse;

    await getDb().collection("courses").add(<String, dynamic>{
      "title": title,
      "description": description,
      "units": [],
    }).then((value) => createdCourse = Course(
        title: title, description: description, units: [], docId: value.id));

    return createdCourse;
  }
}
