import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({
    super.key,
    required this.rating,
  });
  final int rating;


  @override
  State<RatingBarWidget> createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(      
      ignoreGestures: true,
      initialRating: widget.rating.toDouble(),
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.orange.shade600,
      ),
      itemSize: 20,
      onRatingUpdate: (_) {
      },
    );
  }
}
