import 'package:flutter/material.dart';
import 'package:open_course/db_models/course.dart';
import 'package:open_course/widgets/percent_progress_bar.dart';

class CourseCard extends StatelessWidget {
  CourseCard({
    super.key,
    required this.course,
  });

  Course course;

  late String title = course.title ?? "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          color: const Color(0xff111111),
          borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lessons:",
                    style: TextStyle(
                      color: Color.fromARGB(153, 255, 255, 255),
                    ),
                  ),
                  Text(
                    "14",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notes:",
                    style: TextStyle(
                      color: Color.fromARGB(153, 255, 255, 255),
                    ),
                  ),
                  Text(
                    "2",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Lessons completed:",
            style: TextStyle(
              color: Color.fromARGB(153, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "2 / 14",
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          PercentProgressBar(percent: 0.8),
        ],
      ),
    );
  }
}
