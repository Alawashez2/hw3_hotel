import 'package:flutter/material.dart';
import 'package:project2/components/general/reservation_card.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/data/global_data.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/services/supabase.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key,});


  @override
  State<ReservationScreen> createState() => ReservationScreenState();
}

class ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const TextWidget(text: "My Booking"),
      ),
      body: FutureBuilder(
        future: SupabaseService().getReservation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data ?? [];
            return GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 500, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ReservationCard(
                    reservation: list[index],
                  );
                });
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
