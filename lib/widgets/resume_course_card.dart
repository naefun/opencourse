import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ResumeCourseCard extends StatelessWidget {
  const ResumeCourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xff111111),
            borderRadius: BorderRadius.circular(22)),
        child: LayoutGrid(
            columnSizes: [4.fr, 1.fr],
            rowSizes: const [auto],
            columnGap: 20,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
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
                    children: const [
                      Text(
                        "Lessons completed: ",
                        style: TextStyle(
                          color: Color.fromARGB(153, 255, 255, 255),
                        ),
                      ),
                      Text(
                        "12 / 26",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: LinearPercentIndicator(
                      animation: true,
                      lineHeight: 8.0,
                      animationDuration: 1000,
                      percent: 0.8,
                      barRadius: const Radius.circular(50),
                      progressColor: const Color(0xff49C29D),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
                      padding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.07),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                    onPressed: () => log("Resume where you left off"),
                    icon: const Icon(
                      Icons.play_arrow_outlined,
                      color: Color(0xffFFA500),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              )
            ]));
  }
}
