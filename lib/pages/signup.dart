import 'package:flutter/material.dart';
import 'package:open_course/widgets/app_bar_logged_out.dart';

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
      appBar: AppBarLoggedOut(showLogInButton: false,),
      body: Text("Sign up now", style: TextStyle(color: Color(0xffffffff)),),
    );
  }
}