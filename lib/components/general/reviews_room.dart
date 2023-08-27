import 'package:flutter/material.dart';
import 'package:project2/components/general/review_card.dart';
import 'package:project2/components/general/room_information.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/models/room.dart';
import 'package:project2/services/supabase.dart';

class ReviewsRoom extends StatefulWidget {
  const ReviewsRoom({super.key, required this.room, required this.reload});
  final Room room;
  final Function() reload;

  @override
  State<ReviewsRoom> createState() => _ReviewsRoomState();
}

class _ReviewsRoomState extends State<ReviewsRoom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TextWidget(
              text: "Reviews",
              isBold: true,
            ),
            IconButton(
              onPressed: () {
                widget.reload.call();
              },
              icon: Icon(
                Icons.refresh,
                color: darkPrimaryColor,
              ),
            )
          ],
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(border: Border.all(width: 0.2)),
          child: FutureBuilder(
            future: SupabaseService().getReviewByRoomId(widget.room.roomId!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                list = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ReviewCard(
                      review: list[index],
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
