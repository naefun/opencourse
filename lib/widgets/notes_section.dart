import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_course/models/lesson_note.dart';
import 'package:open_course/widgets/notes_tab.dart';

class NotesSection extends StatefulWidget {
  const NotesSection({super.key});

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  int selectedTab = 0;

  List<LessonNote> notes = [
  ];

  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: ListView.builder(
                    itemCount: notes.length > 0 ? notes.length : 1,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if(notes.length==0){
                        notes.add(LessonNote("First note", "content"));
                      }
                      bool activeTab = false;
                      bool showBorder = false;
                      String title = notes[index].getTitle();
                      if(selectedTab == index){
                        activeTab = true;
                      }
                      if(index!=0){
                        showBorder = true;
                      }
                      return NotesTab(active: activeTab, showLeftBorder: showBorder, title: title,);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => addNote(),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(131, 73, 194, 158),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: Icon(
                      Icons.note_add_outlined,
                      size: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                  decoration: BoxDecoration(
                    color: Color(0xff49C29D),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  child: Icon(
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
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xffF3F3F3)),
            child: TextField(
                maxLines: 14,
                decoration: InputDecoration(border: InputBorder.none))),
      ],
    );
  }

  void addNote() {
    List<LessonNote> _notes = List.from(notes);
    _notes.add(LessonNote("New note", ""));
    setState(() {
      notes = _notes;
    });
  }
}
