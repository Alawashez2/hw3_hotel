import 'package:flutter/material.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/reservation.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/screens/reservation_screen.dart';
import 'package:project2/services/supabase.dart';
import 'package:uuid/uuid.dart';

class BookRoom extends StatefulWidget {
  const BookRoom(
      {super.key, required this.room, required this.hotel, required this.user});
  final Room room;
  final Hotel hotel;
  final UserModel user;
  @override
  State<BookRoom> createState() => _BookRoomState();
}

class _BookRoomState extends State<BookRoom> {
  DateTimeRange selectedDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  bool isPicked = false;
  int days = 0;
  double total_price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Center(child: TextWidget(text: "Book Room")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEve,
          children: [
            height48,
            TextWidget(text: widget.hotel.name!),
            height32,
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.hotel.imageUrl!,
                height: 200,
                width: AppLayout.getSize(context).width,
                fit: BoxFit.cover,
              ),
            ),
            height48,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    width: AppLayout.getSize(context).width / 2,
                    child: Column(
                      children: [
                        const TextWidget(
                          text: "choose date",
                          size: 18,
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(bottom: 45),
                          onPressed: () async {
                            final DateTimeRange? dateTimeRange =
                                await showDateRangePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2023, 12, 31));
                            if (dateTimeRange != null) {
                              isPicked = true;
                              selectedDate = dateTimeRange;
                              days = selectedDate.duration.inDays + 1;
                              total_price = days * widget.room.price!;
                              setState(() {});
                            }
                          },
                          icon: const Icon(
                            Icons.date_range_outlined,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: AppLayout.getSize(context).width / 2,
                    child: isPicked
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text:
                                    "from: ${selectedDate.start.day}-${selectedDate.start.month}-${selectedDate.start.year}",
                                size: 20,
                              ),
                              height4,
                              TextWidget(
                                text:
                                    "to: ${selectedDate.end.day}-${selectedDate.end.month}-${selectedDate.end.year}",
                                size: 20,
                              ),
                              height4,
                              TextWidget(
                                text: "day/s: $days",
                                size: 20,
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            height32,
            const Divider(
              thickness: 6,
            ),
            height24,
            Visibility(
              visible: isPicked,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(text: "${widget.room.price} X $days night/s"),
                  TextWidget(text: "$total_price S.R"),
                ],
              ),
            ),
            height64,
            Visibility(
              visible: isPicked,
              child: Button(
                text: "Book Now",
                backgroundColor: primaryColor,
                onPress: () async {
                  final id = const Uuid().v4();
                  await SupabaseService().insertReservation(
                    Reservation(
                        reservationId: id,
                        roomId: widget.room.roomId,
                        userId: widget.user.id,
                        price: total_price,
                        dateFrom:
                            "${selectedDate.start.day}-${selectedDate.start.month}-${selectedDate.start.year}",
                        dateTo:
                            "${selectedDate.end.day}-${selectedDate.end.month}-${selectedDate.end.year}",
                        days: days,
                        hotelId: widget.hotel.hotelId),
                  );
                  context.push(const ReservationScreen());
                },
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
