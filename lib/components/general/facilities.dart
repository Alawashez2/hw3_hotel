import 'package:flutter/material.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: "Facilities",
          isBold: true,
        ),
        height16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // TODO : remove swim icon
            // Column(
            //   children: [
            //     Icon(Icons.pool, color: greyColor, size: 30),
            //     const TextWidget(text: "Swimming pool", size: 12)
            //   ],
            // ),
            Column(
              children: [
                Icon(Icons.airline_seat_recline_extra,
                    color: greyColor, size: 30),
                const TextWidget(text: "relaxing area", size: 14)
              ],
            ),
            Column(
              children: [
                Icon(Icons.spa, color: greyColor, size: 30),
                const TextWidget(text: "garden", size: 14)
              ],
            ),
            Column(
              children: [
                Icon(Icons.tv, color: greyColor, size: 30),
                const TextWidget(text: "cinema hall", size: 14,)
              ],
            ),
            Column(
              children: [
                Icon(Icons.golf_course, color: greyColor, size: 30),
                const TextWidget(text: "golf course", size: 14)
              ],
            ),
          ],
        ),
      ],
    );
  }
}
