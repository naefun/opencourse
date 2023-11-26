import 'package:flutter/material.dart';
import 'percent_progress_bar.dart';

class LessonProgression extends StatelessWidget {
  const LessonProgression({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text("Lessons completed: "),
            Text(
              "12 / 26",
              style: TextStyle(
                  color: Color(0xffffffff), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        PercentProgressBar(percent: 0.8)
      ],
    );
  }
}
