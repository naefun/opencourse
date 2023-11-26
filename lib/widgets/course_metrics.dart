import 'package:flutter/material.dart';

class CourseMetrics extends StatelessWidget {
  const CourseMetrics({super.key, this.showAsColumn = true});

  final bool showAsColumn;

  @override
  Widget build(BuildContext context) {
    Widget metrics = const Wrap(
      runSpacing: 10,
      spacing: 30,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.note_alt_outlined,
              size: 20,
              color: Color(0xffffffff),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Notes: "),
            Text(
              "8",
              style: TextStyle(
                  color: Color(0xffffffff), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.library_books_outlined,
              size: 20,
              color: Color(0xffffffff),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Units: "),
            Text(
              "8",
              style: TextStyle(
                  color: Color(0xffffffff), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.book_outlined,
              size: 20,
              color: Color(0xffffffff),
            ),
            SizedBox(
              width: 10,
            ),
            Text("Lessons: "),
            Text(
              "8",
              style: TextStyle(
                  color: Color(0xffffffff), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );

    return showAsColumn
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              metrics,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              metrics,
            ],
          );
  }
}
