import 'package:flutter/material.dart';

class CourseTag extends StatelessWidget {
  const CourseTag({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(7),
      ),
      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff000000),
        ),
      ),
    );
  }
}
