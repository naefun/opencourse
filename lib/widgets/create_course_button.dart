import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_course/widgets/create_course_form.dart';

class CreateCourseButton extends StatefulWidget {
  const CreateCourseButton({super.key});

  @override
  State<CreateCourseButton> createState() => _CreateCourseButtonState();
}

class _CreateCourseButtonState extends State<CreateCourseButton> {
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff49C29D),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () => showCreateCourseOverlay(),
        icon: const Icon(
          Icons.add,
          color: Color(0xff111111),
        ),
        padding: const EdgeInsets.all(10),
      ),
    );
  }

  void showCreateCourseOverlay() {
    assert(overlayEntry == null);

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Align(
                  alignment: Alignment.center,
                  child: CreateCourseForm(
                    function: (value) => cancelFunction(value),
                  )),
            ),
          ),
        );
      },
    );

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  cancelFunction(bool cancelPressed) {
    if (cancelPressed) {
      removeCreateCourseOverlay();
    }
  }

  void removeCreateCourseOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}
