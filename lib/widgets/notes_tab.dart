import 'package:flutter/material.dart';

class NotesTab extends StatelessWidget {
  NotesTab(
      {super.key,
      this.active = false,
      this.showLeftBorder = true,
      this.title = "New note"});

  bool active;
  bool showLeftBorder;
  String title;

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
          title,
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, .6)),
        ),
      ),
    );
  }
}
