import 'package:flutter/material.dart';
import 'package:open_course/widgets/notes_section.dart';

class LessonActions extends StatefulWidget {
  const LessonActions({Key? key}) : super(key: key);

  @override
  State<LessonActions> createState() => _LessonActionsState();
}

class _LessonActionsState extends State<LessonActions> {
  bool showNotes = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.edit_outlined,
                    color: Color(0xffffffff),
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                child: VerticalDivider(
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
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, showNotes ? .2 : 0),
                      borderRadius: BorderRadius.circular(6)),
                  child: const Icon(
                    Icons.note_alt_outlined,
                    color: Color(0xffffffff),
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                child: VerticalDivider(
                  thickness: 1,
                  width: 40,
                  color: Color.fromRGBO(255, 255, 255, .2),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffffffff),
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                child: VerticalDivider(
                  thickness: 1,
                  width: 40,
                  color: Color.fromRGBO(255, 255, 255, .2),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.all(5),
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
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: NotesSection(),
        )
    ]);
  }
}
