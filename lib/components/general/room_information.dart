import 'package:flutter/material.dart';
import 'package:project2/components/buttons/book_room_button.dart';
import 'package:project2/components/general/facilities.dart';
import 'package:project2/components/general/reviews_room.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';

List list = [];

class RoomInformation extends StatefulWidget {
  const RoomInformation(
      {super.key, required this.room, required this.hotel, required this.user});
  final Room room;
  final Hotel hotel;
  final UserModel user;

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
                text: "(${list.length} reviews)",
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
          ReviewsRoom(
            room: widget.room,
            reload: () {
              setState(() {});
            },
          ),
          height24,
          BookRoomButton(
            hotel: widget.hotel,
            room: widget.room,
            user: widget.user,
          ),
        ],
      ),
    );
  }
}
