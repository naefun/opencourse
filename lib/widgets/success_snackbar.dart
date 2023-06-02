import 'package:flutter/material.dart';

class SuccessSnackbar {
  static void showSnackbar(bool snackbarIsError, String text, BuildContext context, {bool manualClose = false}) {
    Color bgColor = snackbarIsError == true
        ? const Color.fromARGB(255, 245, 122, 122)
        : const Color.fromARGB(255, 162, 228, 158);

    final snackBar = SnackBar(
      duration: manualClose==true?const Duration(seconds: 30):const Duration(seconds: 4),
      showCloseIcon: manualClose,
      backgroundColor: bgColor,
      content: Text(
        text,
        style: const TextStyle(color: Color(0xff000000)),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
