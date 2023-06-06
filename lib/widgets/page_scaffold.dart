import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:open_course/widgets/app_bar_logged_in.dart';
import 'package:open_course/widgets/course_card_large.dart';
import 'package:open_course/widgets/create_course_form.dart';
import 'package:open_course/widgets/percent_progress_bar.dart';

class PageScaffold extends StatefulWidget {
  PageScaffold({
    Key? key,
    required this.children,
    this.includeAppBar = false,
    this.appBarHeading = "",
    this.appBarSubheading = "",
    this.includeAppBarButton = true,
    this.verticalPadding = 20,
    this.horizontalPadding = 20,
  }) : super(key: key);

  List<Widget> children;
  bool includeAppBar;
  String appBarHeading;
  String appBarSubheading;
  bool includeAppBarButton;
  double verticalPadding;
  double horizontalPadding;

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.includeAppBar
          ? AppBarLoggedIn(
              heading: widget.appBarHeading,
              subheading: widget.appBarSubheading,
              showCreateCourseButton: widget.includeAppBarButton,
            )
          : null,
      backgroundColor: Color(0xff171717),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            widget.horizontalPadding,
            widget.verticalPadding,
            widget.horizontalPadding,
            widget.verticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
        ),
      ),
    );
  }
}
