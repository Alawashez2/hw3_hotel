import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/extensions/dialog.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/models/user.dart';
import 'package:project2/services/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return Button(
      text: "Sign Up",
      backgroundColor: primaryColor,
      onPress: () async {
        if (widget.nameController.text.isNotEmpty &&
            widget.emailController.text.isNotEmpty &&
            widget.passwordController.text.isNotEmpty) {
          await supabase.auth.signUp(
            email: widget.emailController.text,
            password: widget.passwordController.text,
          );
          final id = const Uuid().v4();
          await SupabaseService().insertUser(
            UserModel(
              id: id,
              name: widget.nameController.text,
              email: widget.emailController.text,
              password: widget.passwordController.text,
            ),
          );

          if (context.mounted) {
            widget.nameController.text = "";
            widget.emailController.text = "";
            widget.passwordController.text = "";
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              title: 'registered successfully',
              btnOkOnPress: () {},
            ).show();
            context.pop;
          }
        } else {
          context.dialogScreen();
        }
      },
    );
  }
}
