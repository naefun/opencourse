import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_methods.dart';
import 'package:open_course/navigation.dart';
import 'package:open_course/navigators/navigator_handler.dart';
import 'package:open_course/pages/signup.dart';
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
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff171717),
      appBar: AppBarLoggedOut(
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
                    children: [
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
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    FormValidation.validateEmail(value),
                                autofocus: true,
                                controller: emailController,
                                style:
                                    const TextStyle(color: Color(0xffffffff)),
                                expands: false,
                                decoration: FormStyles.textFormFieldDecoration,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Password",
                                style: TextStyle(
                                    color: Color(0xffffffff), fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordTextFormField(
                                  validator: (value) =>
                                      FormValidation.validateFieldNotEmpty(
                                          value,
                                          "Please enter your password."), controller: passwordController,),
                              const SizedBox(
                                height: 60,
                              ),
                              FormButton(
                                onTapFunction: () async {
                                  if (_loginFormKey.currentState!.validate()) {
                                    await signIn(context, emailController.text,
                                        passwordController.text);
                                  }
                                },
                                text: "Log in",
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not a member? ",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Color(0xff49C29D), fontSize: 12),
                            ),
                          ),
                        ],
                      )
                    ],
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
}
