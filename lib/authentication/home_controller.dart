import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_course/navigators/navigator_handler.dart';
import 'package:open_course/pages/logged_out_pages/landing.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(context),
      builder: (context, snapshot) {
        return const LandingPage();
      },
    );
  }

  Future<FirebaseApp> _initializeFirebase(BuildContext context) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (context.mounted && user != null && user.emailVerified) {
      NavigatorHandler.pushReplaceNavigation(context);
    }

    return firebaseApp;
  }
}
