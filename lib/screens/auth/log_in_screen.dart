import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/text/text_field_widget.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/extensions/dialog.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/screens/auth/sign_up_screen.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    print('Token: ${supabase.auth.currentSession?.accessToken}');
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          "https://www.thetimes.co.uk/travel/wp-content/uploads/sites/6/2022/04/Bottom-Bay-Barbados-Paradise-beach-on-the-Caribbean-island-of-Barbados_Credit_Alamy_MNKBGN.jpg",
          height: AppLayout.getSize(context).height,
          width: AppLayout.getSize(context).width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black26),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(75),
                      bottomLeft: Radius.circular(75),
                    )),
                margin: const EdgeInsets.only(top: 100),
                height: AppLayout.getSize(context).height - 350,
                width: AppLayout.getSize(context).width - 20,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const TextWidget(
                        text: "Welcome back",
                      ),
                      TextFieldWidget(
                        controller: emailController,
                        hint: "enter your email",
                        label: "Email",
                        preIcon: const Icon(Icons.mail),
                      ),
                      TextFieldWidget(
                        controller: passwordController,
                        hint: "enter your password",
                        label: "Password",
                        preIcon: const Icon(Icons.person),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            text: "Don't have an account?",
                            size: 16,
                          ),
                          TextButton(
                              onPressed: () {
                                context
                                    .pushAndRemoveUntil(const SignUpScreen());
                              },
                              child: TextWidget(
                                text: "Sign up",
                                size: 16,
                                color: darkPrimaryColor,
                                isBold: true,
                              ))
                        ],
                      ),
                      Button(
                        text: "Log in",
                        backgroundColor: primaryColor,
                        onPress: () async {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            await supabase.auth.signInWithPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            if (context.mounted) {
                              context.push(const HomeScreen());
                            } else {
                              context.dialogScreen();
                            }
                          } else {
                            context.dialogScreen();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
