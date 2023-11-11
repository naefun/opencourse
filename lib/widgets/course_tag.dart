import 'package:flutter/material.dart';

class CourseTag extends StatelessWidget {
  CourseTag({super.key, required this.text, required this.color});

  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.fromLTRB(20, 1, 20, 1),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
