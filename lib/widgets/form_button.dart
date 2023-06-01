import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton(
      {super.key, required this.onTapFunction, required this.text});

  final Function() onTapFunction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await onTapFunction(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xff49C29D),
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
