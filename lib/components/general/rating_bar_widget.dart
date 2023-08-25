import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({super.key, });

  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 0,
      minRating: 0,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) =>  Icon(
        Icons.star,
        color: Colors.orange.shade800,
      ),
      itemSize: 24,
      onRatingUpdate: (rating) {
        
      },
    );
  }
}
