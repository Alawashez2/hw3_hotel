import 'package:flutter/material.dart';
import 'package:project2/components/buttons/sign_up_button.dart';
import 'package:project2/components/text/text_field_widget.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/screens/auth/log_in_screen.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
          text: "Creat New Account",
        ),
        TextFieldWidget(
          controller: nameController,
          hint: "enter your name",
          label: "Name",
          preIcon: const Icon(Icons.person),
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
              text: "Do you have an account?",
              size: 16,
            ),
            TextButton(
                onPressed: () {
                  context.pushAndRemoveUntil(const LogInScreen());
                },
                child: TextWidget(
                  text: "Login",
                  size: 16,
                  isBold: true,
                  color: darkPrimaryColor,
                ))
          ],
        ),
        SignUpButton(
            nameController: nameController,
            emailController: emailController,
            passwordController: passwordController),
      ],
    );
  }
}
