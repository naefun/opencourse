import 'package:flutter/material.dart';
import 'package:open_course/widgets/create_course_button.dart';

class AppBarLoggedIn extends PreferredSize {
  AppBarLoggedIn(
      {super.key,
      super.child = const SizedBox(),
      super.preferredSize = const Size.fromHeight(100),
      this.heading = "Dashboard",
      this.subheading = "",
      this.showCreateCourseButton = true});

  String heading;
  String subheading;
  bool showCreateCourseButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace:
          showCreateCourseButton ? renderCreateCourseButton() : Container(),
      centerTitle: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            heading,
            style: const TextStyle(
                fontSize: 30,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            subheading,
            style: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(255, 255, 255, .3),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: const Color(0xff171717),
      toolbarHeight: 100,
    );
  }

  Widget renderCreateCourseButton() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [CreateCourseButton()],
        ),
      ),
    );
  }
}
