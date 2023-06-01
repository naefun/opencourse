import 'package:flutter/material.dart';

class FormStyles {
  static final InputDecoration textFormFieldDecoration = InputDecoration(
    errorMaxLines: 10,
    filled: true,
    fillColor: const Color(0xff111111),
    enabledBorder: UnderlineInputBorder(
      borderSide:
          const BorderSide(color: Color.fromRGBO(255, 255, 255, 0.4), width: 2),
      borderRadius: BorderRadius.circular(16.0),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffffffff), width: 2),
      borderRadius: BorderRadius.circular(16.0),
    ),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  );
}
