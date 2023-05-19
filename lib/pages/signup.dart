import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_course/pages/login.dart';
import 'package:open_course/widgets/app_bar_logged_out.dart';
import 'package:open_course/widgets/google_text_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                      "Sign up to Open Course",
                      style: TextStyle(color: Color(0xffffffff)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GoogleTextButton(
                      text: "Sign up with Google",
                      action: () => log("Google button clicked"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                        )),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Or",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.5)),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Name",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xffffffff)),
                                expands: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xff111111),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.4),
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
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Username",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style:
                                    const TextStyle(color: Color(0xffffffff)),
                                expands: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xff111111),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.4),
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Email",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Password",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 12),
                        ),
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Color.fromRGBO(73, 194, 157, .5),
                              fontSize: 12),
                        ),
                      ],
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
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(50, 12, 50, 12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff49C29D),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Text(
                          "Create account",
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
                          "Already a member? ",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: const Text(
                            "Log in",
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
