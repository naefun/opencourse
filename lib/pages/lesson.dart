import 'package:flutter/material.dart';
import 'package:open_course/widgets/lesson_actions.dart';
import 'package:open_course/widgets/lesson_dropdown_selector.dart';
import 'package:open_course/widgets/page_scaffold.dart';
import 'package:open_course/widgets/video_player/video_player.dart';

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
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Text(
            "Flutter essentials",
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .8), fontSize: 18),
          ),
        ),
        VideoPlayer(),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              LessonActions(),
              SizedBox(
                height: 30,
              ),
              LessonDropdownSelector(),
              LessonDropdownSelector(),
              LessonDropdownSelector(),
            ],
          ),
        ),
      ],
    );
  }
}
