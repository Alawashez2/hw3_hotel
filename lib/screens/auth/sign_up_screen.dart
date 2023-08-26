import 'package:flutter/material.dart';
import 'package:project2/screens/auth/log_in_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                  'https://www.thetimes.co.uk/travel/wp-content/uploads/sites/6/2022/04/Bottom-Bay-Barbados-Paradise-beach-on-the-Caribbean-island-of-Barbados_Credit_Alamy_MNKBGN.jpg'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(300),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Create New Account',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: 'Enter your Name', label: Text('Name')),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Gmail',
                label: Text(
                  'Gamil',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                label: Text(
                  'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Confairm your Password',
                label: Text(
                  'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(), //HomeScreen
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(300, 60),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
  }
}