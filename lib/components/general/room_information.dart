import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/general/facilities.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/screens/book_room.dart';

class RoomInformation extends StatefulWidget {
  const RoomInformation({super.key, required this.room, required this.hotel});
  final Room room;
  final Hotel hotel;

  @override
  State<RoomInformation> createState() => _RoomInformationState();
}

class _RoomInformationState extends State<RoomInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: widget.hotel.place!,
            color: greyColor,
          ),
          height8,
          Row(
            children: [
              // TODO : add reviews form database
              TextWidget(
                text: "(11 reviews)",
                size: 18,
                color: greyColor,
              ),
              width8,
              TextWidget(
                text: "4.8",
                size: 18,
                color: greyColor,
              ),
              width8,
              const Icon(
                Icons.star,
                color: Colors.amber,
              )
            ],
          ),
          height32,
          const TextWidget(
            text: "Description",
            isBold: true,
          ),
          height16,
          TextWidget(
            text: widget.room.description!,
            color: greyColor,
          ),
          height24,
          const Facilities(),
          height24,
          const TextWidget(
            text: "Reviews",
            isBold: true,
          ),
          height24,
          Container(
            height: 150,
            color: Colors.green,
          ),
          height24,
          Container(
            padding: const EdgeInsets.all(12),
            height: 80,
            // color: Colors.blueGrey.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "Start form",
                      size: 20,
                    ),
                    height8,
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          color: blackColor,
                        ),
                        children: [
                          TextSpan(
                            text: " ${widget.room.price} S.R",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: " /night",
                            style: TextStyle(color: greyColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Button(
                  text: "Book room",
                  backgroundColor: primaryColor,
                  onPress: () {
                    context.push(
                        BookRoom(room: widget.room, hotel: widget.hotel));
                  },
                  color: blackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
