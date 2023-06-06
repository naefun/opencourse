import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_course/pages/logged_out_pages/landing.dart';
import 'package:open_course/pages/logged_out_pages/login.dart';

class AppBarLoggedOut extends PreferredSize {
  AppBarLoggedOut(
      {super.key,
      super.child = const SizedBox(),
      super.preferredSize = const Size.fromHeight(100),
      this.showLogInButton = true});

  bool showLogInButton;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: super.preferredSize,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandingPage()),
                          );
                        },
                        child: const Text(
                          "Open Course",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (showLogInButton == true)
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(30, 6, 30, 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 2, color: const Color(0xff49C29D))),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.login,
                                  color: Color(0xff49C29D),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Log in",
                                  style: TextStyle(
                                      color: Color(0xff49C29D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
