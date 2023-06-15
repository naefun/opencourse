import 'package:flutter/material.dart';

class LessonSelectorItem extends StatelessWidget {
  const LessonSelectorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Flutter essentials",
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            Icons.play_arrow_outlined,
            size: 28,
            color: Color(0xffffffff),
          ),
        )
      ],
    );
  }
}
