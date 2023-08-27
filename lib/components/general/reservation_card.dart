import 'package:flutter/material.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/reservation.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';
import 'package:project2/screens/reservation_screen.dart';
import 'package:project2/services/supabase.dart';

class ReservationCard extends StatefulWidget {
  const ReservationCard({
    super.key,
    this.onTap,
    required this.reservation,
  });

  final Reservation reservation;
  final Function()? onTap;

  @override
  State<ReservationCard> createState() => _ReservationCardState();
}

class _ReservationCardState extends State<ReservationCard> {
  late Room room;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SupabaseService().getHotelById(widget.reservation.hotelId!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Hotel hotel = snapshot.data!;
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 200,
              height: 300,
              child: Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 10,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        hotel.imageUrl!,
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
                            text: hotel.name!,
                            size: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                          height8,
                          TextWidget(
                            text: hotel.place!,
                            size: 16,
                            color: greyColor,
                          ),
                          height16,
                          TextWidget(
                            text: "start date : ${widget.reservation.dateFrom}",
                            size: 16,
                            color: greyColor,
                          ),
                          height4,
                          TextWidget(
                            text: "End date : ${widget.reservation.dateTo}",
                            size: 16,
                            color: greyColor,
                          ),
                          height8,
                          TextWidget(
                            text: "${widget.reservation.days} day/s",
                            size: 16,
                            color: greyColor,
                          ),
                          height16,
                          TextWidget(
                            text: "total price : ${widget.reservation.price} S.R",
                            size: 16,
                            color: greyColor,
                          ),
                          height16,
                          IconButton(
                            onPressed: () {
                              SupabaseService().deleteReservation(widget.reservation.reservationId ?? "");
                              setState(() {
                              context.findAncestorStateOfType<ReservationScreenState>()!.setState(() {
                              });
                                
                              });
                          }, icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else{
            return const SizedBox.shrink();
          }
        });
  }
}
