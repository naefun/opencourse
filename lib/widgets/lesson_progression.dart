import 'package:flutter/material.dart';
import 'percent_progress_bar.dart';

class LessonProgression extends StatelessWidget {
  const LessonProgression({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text("Lessons completed: "),
            Text(
              "12 / 26",
              style: TextStyle(
                  color: Color(0xffffffff), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        PercentProgressBar(percent: 0.8)
      ],
    );
  }
}
