import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_methods.dart';
import 'package:open_course/navigators/navigator_handler.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Welcome ${FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.displayName != null ? FirebaseAuth.instance.currentUser!.displayName : 'user'}",
            style: const TextStyle(color: Color(0xffffffff), fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => signOut(),
            child: const Text("Sign out"),
          ),
        ],
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
