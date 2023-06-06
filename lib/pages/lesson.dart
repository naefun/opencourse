import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/widgets/course_card_large.dart';
import 'package:open_course/widgets/create_course_form.dart';
import 'package:open_course/widgets/lesson_dropdown_selector.dart';
import 'package:open_course/widgets/notes_section.dart';
import 'package:open_course/widgets/page_scaffold.dart';
import 'package:open_course/widgets/percent_progress_bar.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool showNotes = false;

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      includeAppBar: true,
      appBarHeading: "Lesson",
      appBarSubheading: "1 / 12",
      includeAppBarButton: false,
      horizontalPadding: 0,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            "Flutter essentials",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .8), fontSize: 18),
          ),
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff111111),
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => {},
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xffffffff),
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1,
                          width: 40,
                          color: Color.fromRGBO(255, 255, 255, .2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          showNotes = !showNotes;
                        }),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  255, 255, 255, showNotes ? .2 : 0),
                              borderRadius: BorderRadius.circular(6)),
                          child: const Icon(
                            Icons.note_alt_outlined,
                            color: Color(0xffffffff),
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1,
                          width: 40,
                          color: Color.fromRGBO(255, 255, 255, .2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {},
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xffffffff),
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1,
                          width: 40,
                          color: Color.fromRGBO(255, 255, 255, .2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {},
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Color(0xffffffff),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (showNotes)
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: NotesSection(),
                ),
              SizedBox(
                height: 30,
              ),
              LessonDropdownSelector(),
            ],
          ),
        ),
      ],
    );
  }
}
