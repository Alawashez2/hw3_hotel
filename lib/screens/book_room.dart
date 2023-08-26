import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/components/buttons/button.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/models/room.dart';

class BookRoom extends StatefulWidget {
  const BookRoom({super.key, required this.room});
  final Room room;

  @override
  State<BookRoom> createState() => _BookRoomState();
}

class _BookRoomState extends State<BookRoom> {
  DateTimeRange selectedDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Center(child: TextWidget(text: "Book Room")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("days: ${selectedDate.duration.inDays +1 }"),
          Button(
            text: "Pick Date",
            backgroundColor: greyColor,
            onPress: () async {
              final DateTimeRange? dateTimeRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2023,12,31));
                  if(dateTimeRange != null){
                    selectedDate = dateTimeRange;
                    setState(() {
                      
                    });
                  }
            },
          )
        ],
      ),
    );
  }
}
