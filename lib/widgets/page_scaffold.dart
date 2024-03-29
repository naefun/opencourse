import 'package:flutter/material.dart';
import 'package:open_course/widgets/app_bar_logged_in.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({
    Key? key,
    required this.children,
    this.includeAppBar = false,
    this.appBarHeading = "",
    this.appBarSubheading = "",
    this.includeAppBarButton = true,
    this.verticalPadding = 20,
    this.horizontalPadding = 20,
  }) : super(key: key);

  final List<Widget> children;
  final bool includeAppBar;
  final String appBarHeading;
  final String appBarSubheading;
  final bool includeAppBarButton;
  final double verticalPadding;
  final double horizontalPadding;

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
      backgroundColor: const Color(0xff171717),
      body: DefaultTextStyle(
        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
        child: SingleChildScrollView(
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
      ),
    );
  }
}
