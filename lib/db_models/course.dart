import 'package:cloud_firestore/cloud_firestore.dart';

class Course {
  final String? title;
  final String? description;
  final List<Map<String, dynamic>>? units;

  Course({this.title, this.description, this.units});

  factory Course.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Course(
      title: data?['title'],
      description: data?['description'],
      units: data?['units'] is Iterable ? List.from(data?['units']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (title != null) "title": title,
      if (description != null) "description": description,
      if (units != null) "units": units
    };
  }
}
