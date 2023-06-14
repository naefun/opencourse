import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_provider.dart';
import 'package:open_course/authentication/auth_service.dart';
import 'package:open_course/authentication/home_controller.dart';
import 'package:open_course/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Provider(
        auth: AuthService(),
        child: const MaterialApp(
          home: HomeController(),
        ));
  }
}
