import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 1,
          color: Color.fromRGBO(255, 255, 255, 0.2),
        )),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Or",
            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 1,
          color: Color.fromRGBO(255, 255, 255, 0.2),
        )),
      ],
    );
  }
}
