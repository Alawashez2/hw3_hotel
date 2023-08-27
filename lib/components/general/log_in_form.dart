import 'package:flutter/material.dart';
import 'package:project2/components/buttons/log_in_button.dart';
import 'package:project2/components/text/text_field_widget.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/screens/auth/sign_up_screen.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({
    super.key,
  });

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
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
    return Column(
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
                  context.pushAndRemoveUntil(const SignUpScreen());
                },
                child: TextWidget(
                  text: "Sign up",
                  size: 16,
                  color: darkPrimaryColor,
                  isBold: true,
                ))
          ],
        ),
        LogInButton(emailController: emailController,passwordController: passwordController),
      ],
    );
  }
}
