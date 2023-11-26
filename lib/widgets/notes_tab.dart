import 'package:flutter/material.dart';

class NotesTab extends StatelessWidget {
  const NotesTab(
      {super.key,
      this.active = false,
      this.showLeftBorder = true,
      this.title = "New note"});

  final bool active;
  final bool showLeftBorder;
  final String title;

  @override
  Widget build(BuildContext context) {
    Color bgColour = active ? const Color(0xffF3F3F3) : const Color(0xffB5B5B5);

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
              color: const Color.fromRGBO(0, 0, 0, .1),
              width: showLeftBorder ? 1 : 0),
        ),
        color: bgColour,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Color.fromRGBO(0, 0, 0, .6)),
        ),
      ),
    );
  }
}
