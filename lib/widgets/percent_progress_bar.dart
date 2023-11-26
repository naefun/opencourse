import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentProgressBar extends StatelessWidget {
  const PercentProgressBar({
    super.key,
    required this.percent,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      lineHeight: 8.0,
      animationDuration: 1000,
      percent: percent,
      barRadius: const Radius.circular(50),
      progressColor: const Color(0xff49C29D),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.2),
      padding: const EdgeInsets.all(0),
    );
  }
}
