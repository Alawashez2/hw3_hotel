import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/text/text_field_widget.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/screens/auth/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
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
                        text: "Creat New Account",
                      ),
                      const TextFieldWidget(
                        hint: "enter your name",
                        label: "Name",
                        preIcon: Icon(Icons.person),
                      ),
                      const TextFieldWidget(
                        hint: "enter your email",
                        label: "Email",
                        preIcon: Icon(Icons.mail),
                      ),
                      const TextFieldWidget(
                        hint: "enter your password",
                        label: "Password",
                        preIcon: Icon(Icons.person),
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
                      Button(
                        text: "Sign Up",
                        backgroundColor: primaryColor,
                        onPress: () {},
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
