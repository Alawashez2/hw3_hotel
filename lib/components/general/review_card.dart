import 'package:flutter/material.dart';
import 'package:project2/components/general/rating_bar_widget.dart';
import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/constants.dart';
import 'package:project2/models/review.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key, required this.review,});
  final Review review;
  


  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBarWidget(rating: widget.review.rating!),
              height16,
              TextWidget(text: widget.review.text! ,size: 18,)
            ],
          ),
        ),
      ),
    );
  }
}