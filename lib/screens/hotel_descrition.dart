import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/buttons/style_text.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';


class DescroptionPage extends StatefulWidget {
  const DescroptionPage({super.key, required});

  @override
  _DescroptionPage createState() => _DescroptionPage();
}

class _DescroptionPage extends State<DescroptionPage> {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: height / 3,
                child: Image.network(
                  'https://www.thetimes.co.uk/travel/wp-content/uploads/sites/6/2022/04/Bottom-Bay-Barbados-Paradise-beach-on-the-Caribbean-island-of-Barbados_Credit_Alamy_MNKBGN.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 250,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'data',
                          color: Colors.black,
                        ),
                        Icon(Icons.favorite),
                      ],
                    ),
                    height8, //sized

                    const CustomText(
                      text: 'data',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                        const CustomText(
                          text: 'data',
                        ),
                      ],
                    ),

                    height32,
                    const CustomText(
                      text: 'Description',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),

                    height16,
                    const Text(
                      'data',
                    ),
                    height64,
                    const CustomText(
                      text: 'facilities',
                      fontWeight: FontWeight.bold,
                    ),
                    height64,
                    const CustomText(
                      text: 'Review',
                    ),
                    height24,
                    const CustomText(
                      text: 'data',
                    ),
                    height16,
                    const CustomText(
                      text: 'data',
                    ),

                    height64,
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Button(
                        backgroundColor: Colors.black,
                        text: 'Book Room',
                        color: blackColor,
                        btnWidth: 400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}
