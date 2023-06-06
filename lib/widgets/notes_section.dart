import 'package:flutter/material.dart';

class NotesSection extends StatefulWidget {
  const NotesSection({super.key});

  @override
  State<NotesSection> createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  List<Widget> notes = [
    NotesTab(
      active: true,
      showLeftBorder: false,
    ),
    NotesTab(),
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
            Expanded(
              child: SizedBox(
                height: 40,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        child: Row(
                          children: notes,
                        ),
                      )
                    ],
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
    List<Widget> _notes = List.from(notes);
    _notes.add(NotesTab());
    setState(() {
      notes = _notes;
    });
  }
}

class NotesTab extends StatelessWidget {
  NotesTab({super.key, this.active = false, this.showLeftBorder = true});

  bool active;
  bool showLeftBorder;

  @override
  Widget build(BuildContext context) {
    Color bgColour = active ? Color(0xffF3F3F3) : Color(0xffB5B5B5);

    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
              color: Color.fromRGBO(0, 0, 0, .1),
              width: showLeftBorder ? 1 : 0),
        ),
        color: bgColour,
      ),
      child: Center(
        child: Text(
          "Some note",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, .6)),
        ),
      ),
    );
  }
}
