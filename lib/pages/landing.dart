import 'package:flutter/material.dart';
import 'package:open_course/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_course/pages/signup.dart';
import 'package:open_course/widgets/app_bar_logged_out.dart';

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
        appBar: AppBarLoggedOut(
          preferredSize: const Size.fromHeight(100),
          child: const Text("Test"),
        ),
        body: Stack(
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
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
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
                                          color:
                                              Color.fromRGBO(255, 255, 255, .6),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xff49C29D)),
                              child: const Text("Sign up"),
                            ),
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
