import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_methods.dart';
import 'package:open_course/navigators/navigator_handler.dart';
import 'package:open_course/pages/landing.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
            ElevatedButton(onPressed: () => signOut(), child: Text("Sign out")),
      ),
    );
  }

  Future<void> signOut() async {
    await FireAuth.signOut();
    if (context.mounted) {
      NavigatorHandler.pushReplaceLandingPage(context);
    }
  }
}
