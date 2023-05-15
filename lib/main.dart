import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_course/firebase_options.dart';
import 'package:open_course/navigation.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: Navigation(),
      ),
    );
  }
}
