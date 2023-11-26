import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/db_models/course.dart';
import 'package:open_course/navigators/navigator_handler.dart';
import 'package:open_course/widgets/course_metrics.dart';

import 'lesson_progression.dart';

class CourseCardLarge extends StatelessWidget {
  CourseCardLarge({
    super.key,
    required this.course,
  });

  final Course course;

  late final String title = course.title ?? "";

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
      child: GestureDetector(
        onTap: () => NavigatorHandler.pushCoursePage(context),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          decoration: BoxDecoration(
              color: const Color(0xff111111),
              borderRadius: BorderRadius.circular(22)),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              LayoutGrid(
                columnSizes: [2.fr, auto],
                rowSizes: const [auto, auto],
                rowGap: 20,
                columnGap: 20,
                children: [
                  const GridPlacement(
                      columnStart: 0,
                      columnSpan: 1,
                      rowStart: 0,
                      rowSpan: 1,
                      child: CourseMetrics()),
                  GridPlacement(
                    columnStart: 1,
                    columnSpan: 1,
                    rowStart: 0,
                    rowSpan: 1,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(14, 1, 14, 1),
                            decoration: BoxDecoration(
                                color: const Color(0xffFCAFAF),
                                borderRadius: BorderRadius.circular(3)),
                            child: const Text(
                              "Web",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(14, 1, 14, 1),
                            decoration: BoxDecoration(
                                color: const Color(0xffE8FACC),
                                borderRadius: BorderRadius.circular(3)),
                            child: const Text(
                              "Front-End",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(14, 1, 14, 1),
                            decoration: BoxDecoration(
                                color: const Color(0xffCFFFF9),
                                borderRadius: BorderRadius.circular(3)),
                            child: const Text(
                              "JavaScript",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Color(0xff000000)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const GridPlacement(
                      columnStart: 0,
                      columnSpan: 2,
                      rowStart: 1,
                      rowSpan: 1,
                      child: LessonProgression())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
