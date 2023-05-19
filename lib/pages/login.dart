import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_course/navigation.dart';
import 'package:open_course/pages/signup.dart';
import 'package:open_course/widgets/app_bar_logged_out.dart';
import 'package:open_course/widgets/google_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff171717),
      appBar: AppBarLoggedOut(
        showLogInButton: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Log in to Open Course",
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GoogleTextButton(
                      text: "Log in with Google",
                      action: () => log("Google button clicked"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                        )),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Or",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.5)),
                          ),
                        ),
                        const Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Username / Email",
                      style: TextStyle(color: Color(0xffffffff), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Color(0xffffffff)),
                      expands: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff111111),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.4),
                              width: 2),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffffffff), width: 2),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(color: Color(0xffffffff), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      autocorrect: false,
                      style: const TextStyle(color: Color(0xffffffff)),
                      expands: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff111111),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.4),
                              width: 2),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xffffffff), width: 2),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Navigation()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff49C29D),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member? ",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                color: Color(0xff49C29D), fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
