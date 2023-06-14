import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  PasswordTextFormField(
      {super.key, required this.validator, required this.controller});

  Function(String? value) validator;
  TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => widget.validator(value),
        controller: widget.controller,
        obscureText: _passwordObscured,
        autocorrect: false,
        style: const TextStyle(color: Color(0xffffffff)),
        expands: false,
        decoration: InputDecoration(
          errorMaxLines: 10,
          filled: true,
          fillColor: const Color(0xff111111),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(255, 255, 255, 0.4), width: 2),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffffffff), width: 2),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordObscured
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: const Color.fromRGBO(255, 255, 255, 0.5),
            ),
            onPressed: () {
              setState(() {
                _passwordObscured = !_passwordObscured;
              });
            },
          ),
        ));
  }
}
