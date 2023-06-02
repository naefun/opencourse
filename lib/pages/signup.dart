import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_course/authentication/auth_methods.dart';
import 'package:open_course/pages/login.dart';
import 'package:open_course/styles/form_styles.dart';
import 'package:open_course/validation/form_validation.dart';
import 'package:open_course/widgets/app_bar_logged_out.dart';
import 'package:open_course/widgets/form_button.dart';
import 'package:open_course/widgets/google_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_course/widgets/or_divider.dart';
import 'package:open_course/widgets/password_text_form_field.dart';
import 'package:open_course/widgets/success_snackbar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool accountCreatedSuccessfully = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordObscured = true;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

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
                        "Sign up to Open Course",
                        style: TextStyle(color: Color(0xffffffff)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      accountCreatedSuccessfully
                          ? const Text(
                              "Account created successfully, please check your inbox and verify your email to be able to log in.",
                              style: TextStyle(
                                  color: Color(0xff49C29D), fontSize: 14))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GoogleTextButton(
                                  text: "Sign up with Google",
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
                                  key: _registerFormKey,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Name",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                      validator: (value) =>
                                                          FormValidation
                                                              .validateFieldNotEmpty(
                                                                  value,
                                                                  "Please enter your name."),
                                                      controller:
                                                          nameController,
                                                      autofocus: true,
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xffffffff)),
                                                      expands: false,
                                                      decoration: FormStyles
                                                          .textFormFieldDecoration)
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Username",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontSize: 12),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    validator: (value) =>
                                                        FormValidation
                                                            .validateFieldNotEmpty(
                                                                value,
                                                                "Please enter a username."),
                                                    controller:
                                                        usernameController,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffffffff)),
                                                    expands: false,
                                                    decoration: FormStyles
                                                        .textFormFieldDecoration,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        const Text(
                                          "Email",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            validator: (value) =>
                                                FormValidation.validateEmail(
                                                    value),
                                            controller: emailController,
                                            style: const TextStyle(
                                                color: Color(0xffffffff)),
                                            expands: false,
                                            decoration: FormStyles
                                                .textFormFieldDecoration),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        const Text(
                                          "Password",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        PasswordTextFormField(
                                          validator: (value) => FormValidation
                                              .validateRegistrationPassword(
                                                  value),
                                          controller: passwordController,
                                        ),
                                        const SizedBox(
                                          height: 60,
                                        ),
                                        FormButton(
                                            onTapFunction: () async {
                                              if (_registerFormKey.currentState!
                                                  .validate()) {
                                                await (signUp());
                                                log("All fields satisfied");
                                              } else {
                                                log("All fields not satisfied");
                                              }
                                              log(nameController.text);
                                              log(usernameController.text);
                                              log(emailController.text);
                                              log(passwordController.text);
                                            },
                                            text: "Create account"),
                                      ]),
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already a member? ",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              "Log in",
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

  Future<void> signUp() async {
    final user = await FireAuth.registerUsingEmailPassword(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text);

    if (context.mounted) {
      if (user != null) {
        SuccessSnackbar.showSnackbar(
            false, "Account created successfully.", context);
        setState(() {
          accountCreatedSuccessfully = true;
        });
      } else {
        SuccessSnackbar.showSnackbar(true,
            "Account could not be created, email may be in use...", context);
      }
    }

    // await FirebaseAuth.instance.signInWithEmailAndPassword(email: "test14@test.com", password: "password1");
  }
}
