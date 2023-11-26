import 'package:flutter/material.dart';
import 'package:open_course/models/lesson_note.dart';
import 'package:open_course/widgets/notes_tab.dart';

class NotesSection extends StatefulWidget {
  const NotesSection({super.key});

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  String initialNoteContent = "Write your first note";
  int activeNoteIndex = 0;
  TextEditingController noteController = TextEditingController();

  List<LessonNote> notes = [];

  @override
  Widget build(BuildContext context) {
    if (notes.isNotEmpty) {
      noteController.text = notes[activeNoteIndex].getContent();
    } else {
      noteController.text = initialNoteContent;
    }

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SizedBox(
                height: 40,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: ListView.builder(
                    itemCount: notes.isNotEmpty ? notes.length : 1,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return buildNoteTab(context, index);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => addNote(),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(131, 73, 194, 158),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: const Icon(
                      Icons.note_add_outlined,
                      size: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                  decoration: const BoxDecoration(
                    color: Color(0xff49C29D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  child: const Icon(
                    Icons.save_outlined,
                    size: 20,
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xffF3F3F3)),
            child: TextField(
                onChanged: (input) => {updateNoteContent(input)},
                controller: noteController,
                maxLines: 14,
                decoration: const InputDecoration(border: InputBorder.none))),
      ],
    );
  }

  void addNote() {
    List<LessonNote> notesCpy = List.from(notes);
    notesCpy.add(LessonNote("New note", ""));
    setState(() {
      notes = notesCpy;
    });
  }

  void updateNoteContent(String input) {
    String content = notes[activeNoteIndex].getContent();
    content = input;
    LessonNote note = notes[activeNoteIndex];
    note.setContent(content);
    notes[activeNoteIndex] = note;
  }

  void tabOnTap(GlobalKey dataKey, int index) {
    Scrollable.ensureVisible(
      dataKey.currentContext!,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Scrollable.ensureVisible(
      dataKey.currentContext!,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      activeNoteIndex = index;
    });
  }

  Widget buildNoteTab(BuildContext context, int index) {
    if (notes.isEmpty) {
      notes.add(LessonNote("First note", initialNoteContent));
    }
    GlobalKey dataKey = GlobalKey();
    bool activeTab = false;
    bool showBorder = false;
    String title = notes[index].getTitle();
    if (activeNoteIndex == index) {
      activeTab = true;
    }
    if (index != 0) {
      showBorder = true;
    }
    return GestureDetector(
      key: dataKey,
      onTap: () {
        tabOnTap(dataKey, index);
      },
      child: NotesTab(
        active: activeTab,
        showLeftBorder: showBorder,
        title: title,
      ),
    );
  }
}
