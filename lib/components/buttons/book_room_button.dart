import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';
import 'package:project2/screens/book_room.dart';

class BookRoomButton extends StatefulWidget {
  const BookRoomButton(
      {super.key, required this.hotel, required this.room, required this.user});
  final Hotel hotel;
  final Room room;
  final UserModel user;

  @override
  State<BookRoomButton> createState() => _BookRoomButtonState();
}

class _BookRoomButtonState extends State<BookRoomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: const TextStyle(
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
              context.push(BookRoom(room: widget.room, hotel: widget.hotel,user: widget.user,));
            },
            color: blackColor,
          ),
        ],
      ),
    );
  }
}
