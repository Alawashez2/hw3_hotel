import 'package:flutter/material.dart';
import 'package:project2/components/general/log_in_form.dart';
import 'package:project2/constants/constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: LogInForm(),
                ),
              ),
            )),
      ],
    );
  }
}
