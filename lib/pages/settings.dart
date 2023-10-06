import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_methods.dart';
import 'package:open_course/navigators/navigator_handler.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
