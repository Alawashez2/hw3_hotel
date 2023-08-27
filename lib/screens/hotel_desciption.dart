import 'package:flutter/material.dart';
import 'package:project2/components/general/room_information.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';

class HotelDescription extends StatefulWidget {
  const HotelDescription({super.key, required this.room, required this.hotel, required this.user});
  final Room room;
  final Hotel hotel;
  final UserModel user;

  @override
  State<HotelDescription> createState() => _HotelDescriptionState();
}

class _HotelDescriptionState extends State<HotelDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: AppLayout.getSize(context).height / 2,
          toolbarHeight: 120,
          backgroundColor: primaryColor,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsetsDirectional.only(bottom: 0),
            centerTitle: true,
            title: Container(
              width: AppLayout.getSize(context).width,
              color: primaryColor,
              child: TextWidget(
                text: widget.hotel.name!,
                color: blackColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            background: Image.network(
              widget.room.imageUrl!,
              fit: BoxFit.cover,
            ),
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, _) {
              return RoomInformation(
                hotel: widget.hotel,
                room: widget.room,
                user : widget.user,
              );
            },
            childCount: 1,
          ),
        ),
      ],
    ));
  }
}
