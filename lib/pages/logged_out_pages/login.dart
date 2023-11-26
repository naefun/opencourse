import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_methods.dart';
import 'package:open_course/navigators/navigator_handler.dart';
import 'package:open_course/pages/logged_out_pages/signup.dart';
import 'package:open_course/styles/form_styles.dart';
import 'package:open_course/validation/form_validation.dart';
import 'package:open_course/widgets/app_bar_logged_out.dart';
import 'package:open_course/widgets/form_button.dart';
import 'package:open_course/widgets/google_text_button.dart';
import 'package:open_course/widgets/or_divider.dart';
import 'package:open_course/widgets/password_text_form_field.dart';
import 'package:open_course/widgets/success_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController accountRecoveryEmailController =
      TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _accountRecoveryFormKey = GlobalKey<FormState>();
  bool activateAccountRecoveryForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff171717),
      appBar: const AppBarLoggedOut(
        showLogInButton: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: activateAccountRecoveryForm
                        ? showAccountRecoveryForm()
                        : showLoginForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    User? user = await FireAuth.signInUsingEmailPassword(
      email: email,
      password: password,
      context: context,
    );

    if (context.mounted) {
      if (user != null) {
        if (!user.emailVerified) {
          SuccessSnackbar.showSnackbar(
              true,
              "Please check your inbox and verify your email before logging in.",
              context);
        } else {
          NavigatorHandler.pushReplaceNavigation(context);
        }
      } else if (user == null) {
        SuccessSnackbar.showSnackbar(
            true, 'Email or password incorrect', context);
      }
    }
  }

  List<Widget> showLoginForm() {
    return [
      const Text(
        "Log in to Open Course",
        style: TextStyle(color: Color(0xffffffff)),
      ),
      const SizedBox(
        height: 30,
      ),
      GoogleTextButton(
        text: "Log in with Google",
        action: () => log("Google button clicked"),
      ),
      const SizedBox(
        height: 30,
      ),
      const OrDivider(),
      const SizedBox(
        height: 40,
      ),
      Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(color: Color(0xffffffff), fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) => FormValidation.validateEmail(value),
              autofocus: true,
              controller: emailController,
              style: const TextStyle(color: Color(0xffffffff)),
              expands: false,
              decoration: FormStyles.textFormFieldDecoration,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(color: Color(0xffffffff), fontSize: 12),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    activateAccountRecoveryForm = true;
                  }),
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Color.fromRGBO(73, 194, 157, .5), fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PasswordTextFormField(
              validator: (value) => FormValidation.validateFieldNotEmpty(
                  value, "Please enter your password."),
              controller: passwordController,
            ),
            const SizedBox(
              height: 60,
            ),
            FormButton(
              onTapFunction: () async {
                if (_loginFormKey.currentState!.validate()) {
                  await signIn(
                      context, emailController.text, passwordController.text);
                }
              },
              text: "Log in",
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a member? ",
            style: TextStyle(color: Color(0xffffffff), fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
              );
            },
            child: const Text(
              "Sign up",
              style: TextStyle(color: Color(0xff49C29D), fontSize: 12),
            ),
          ),
        ],
      )
    ];
  }

  List<Widget> showAccountRecoveryForm() {
    return [
      const Text(
        "Account recovery",
        style: TextStyle(color: Color(0xffffffff)),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Submit your email to receive a password reset link to your inbox.",
        style:
            TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5), fontSize: 12),
      ),
      const SizedBox(
        height: 40,
      ),
      Form(
        key: _accountRecoveryFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(color: Color(0xffffffff), fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) => FormValidation.validateEmail(value),
              autofocus: true,
              controller: accountRecoveryEmailController,
              style: const TextStyle(color: Color(0xffffffff)),
              expands: false,
              decoration: FormStyles.textFormFieldDecoration,
            ),
            const SizedBox(
              height: 60,
            ),
            FormButton(
              onTapFunction: () async {
                if (_accountRecoveryFormKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: accountRecoveryEmailController.text);
                  } on FirebaseAuthException catch (e) {
                    log(e.code.toString());
                  }
                  if (context.mounted) {
                    SuccessSnackbar.showSnackbar(
                        false,
                        "A password reset link has been sent to ${accountRecoveryEmailController.text} if an account exists with the email address.",
                        context,
                        manualClose: true);
                  }
                }
              },
              text: "Reset password",
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Remember your password? ",
            style: TextStyle(color: Color(0xffffffff), fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                activateAccountRecoveryForm = false;
              });
            },
            child: const Text(
              "Log in",
              style: TextStyle(color: Color(0xff49C29D), fontSize: 12),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a member? ",
            style: TextStyle(color: Color(0xffffffff), fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignupPage()),
              );
            },
            child: const Text(
              "Sign up",
              style: TextStyle(color: Color(0xff49C29D), fontSize: 12),
            ),
          ),
        ],
      ),
    ];
  }
}
