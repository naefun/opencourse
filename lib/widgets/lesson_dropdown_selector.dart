import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/widgets/lesson_selector_item.dart';
import 'package:open_course/widgets/percent_progress_bar.dart';

class LessonDropdownSelector extends StatefulWidget {
  const LessonDropdownSelector({super.key});

  @override
  State<LessonDropdownSelector> createState() => _LessonDropdownSelectorState();
}

class _LessonDropdownSelectorState extends State<LessonDropdownSelector> {
  bool showLessons = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: const Color(0xff242424),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showLessons = !showLessons;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff111111),
                  borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: LayoutGrid(
                columnSizes: [2.fr, auto],
                rowSizes: const [auto],
                rowGap: 20,
                columnGap: 20,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Intro to flutter",
                        style:
                            TextStyle(color: Color(0xffffffff), fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            flex: 4,
                            child: PercentProgressBar(
                              percent: .2,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                              flex: 1,
                              child: Text(
                                "2 / 4",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        showLessons == false
                            ? Icons.expand_more
                            : Icons.expand_less_outlined,
                        color: const Color(0xffffffff),
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showLessons)
            Container(
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [
                  LessonSelectorItem(),
                  SizedBox(
                    height: 10,
                  ),
                  LessonSelectorItem(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
