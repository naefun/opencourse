import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

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
          const Text(
            "Course title",
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
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
                children: const [
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
          LinearPercentIndicator(
            animation: true,
            lineHeight: 8.0,
            animationDuration: 1000,
            percent: 0.8,
            barRadius: const Radius.circular(50),
            progressColor: const Color(0xff49C29D),
            backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
            padding: const EdgeInsets.all(0),
          ),
        ],
      ),
    );
  }
}
