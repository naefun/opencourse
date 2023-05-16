import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_course/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xff171717),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Open Course",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold),
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
        ),
        body: 
        Stack(
          children: [
            Stack(
              children: [
                Opacity(
                    opacity: .05,
                    child: SvgPicture.asset(
                      "lib/assets/images/patternpad.svg",
                      fit: BoxFit.cover,
                    )),
                Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.8],
                  colors: [
                    Color(0xff171717),
                    Colors.transparent,
                  ],
                ))),
              ],
            ),
            Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Learn.",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.bold,
                              fontSize: 90),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Your way.",
                          style: TextStyle(
                              color: Color(0xff49C29D),
                              fontWeight: FontWeight.bold,
                              fontSize: 90),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 330,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                    text:
                                        'Create courses from educational content available on YouTube, and track your progress as you learn ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, .6),
                                        height: 1.5)),
                                TextSpan(
                                  text: '🌟',
                                  style: GoogleFonts.notoColorEmoji(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xff49C29D)),
                          child: const Text("Sign up"),
                        )
                      ],
                                  ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
