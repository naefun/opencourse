import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/navigators/navigator_handler.dart';
import 'package:open_course/widgets/percent_progress_bar.dart';

class CourseCardLarge extends StatelessWidget {
  const CourseCardLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
      child: GestureDetector(
        onTap: () => NavigatorHandler.pushLessonPage(context),
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
              const Text(
                "Course title",
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              LayoutGrid(
                columnSizes: [2.fr, auto],
                rowSizes: const [auto],
                rowGap: 20,
                columnGap: 20,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Wrap(
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
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold),
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
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold),
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
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text("Lessons completed: "),
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
                      PercentProgressBar(percent: 0.8)
                    ],
                  ),
                  Align(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
