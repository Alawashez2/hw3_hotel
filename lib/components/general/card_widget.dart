import 'package:flutter/material.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';
import 'package:project2/screens/hotel_desciption.dart';
import 'package:project2/services/supabase.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, this.onTap, required this.hotel, required this.user});
  final Hotel hotel;
  final UserModel user;
  final Function()? onTap;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late Room room;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 200,
      height: 260,
      child: InkWell(
        onTap: () {
          context.push(HotelDescription(room: room,hotel: widget.hotel,user: widget.user,));
        },
        child: Card(
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.hotel.imageUrl!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextWidget(
                      text: widget.hotel.name!,
                      size: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                    height8,
                    TextWidget(
                      text: widget.hotel.place!,
                      size: 16,
                      color: greyColor,
                    ),
                    height16,
                    FutureBuilder(
                      future: SupabaseService()
                          .getRoomFromHoteleId(widget.hotel.roomId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          room = snapshot.data!;
                          return RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: blackColor,
                              ),
                              children: [
                                TextSpan(
                                  text: " ${room.price} S.R",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: " /night",
                                  style: TextStyle(color: greyColor),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
