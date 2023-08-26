import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/extensions/dialog.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInButton extends StatefulWidget {
  const LogInButton(
      {super.key,
      required this.emailController,
      required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    return Button(
      text: "Log in",
      backgroundColor: primaryColor,
      onPress: () async {
        if (widget.emailController.text.isNotEmpty &&
            widget.passwordController.text.isNotEmpty) {
          await supabase.auth.signInWithOtp(
            email: widget.emailController.text,
          );
          if (context.mounted) {
            context.pushAndRemoveUntil(const HomeScreen());
          } else {
            context.dialogScreen();
          }
        } else {
          context.dialogScreen();
        }
      },
    );
  }
}
