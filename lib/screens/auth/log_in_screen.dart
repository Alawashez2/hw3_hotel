import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/components/text/textfield_custom.dart';
import 'package:project2/screens/home_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                'https://www.thetimes.co.uk/travel/wp-content/uploads/sites/6/2022/04/Bottom-Bay-Barbados-Paradise-beach-on-the-Caribbean-island-of-Barbados_Credit_Alamy_MNKBGN.jpg'),
          ),
          height64,
          const Text(
            'Welcome back',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          height24,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextField(
              borderColor: Colors.black,
              hintText: 'Enter your Name',
              labelText: 'Name',
            ),
          ),
          height16,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextField(
              borderColor: Colors.black,
              hintText: 'Enter Your Email',
              labelText: 'Email',
            ),
          ),
          height16,
          GestureDetector(
            onTap: () {
              // print('object');
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Button(
              backgroundColor: primaryColor,
              text: 'login',
            ),
          ),
          height16,
          GestureDetector(
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Button(
              backgroundColor: primaryColor,
              text: 'login',
            ),
          ),
          height16,
          GestureDetector(
            onTap: () {
              // print('object');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Button(
              backgroundColor: primaryColor,
              text: 'login',
            ),
          ),
        ],
      ),
    );
  }
}
