class Review {
  String? reviewId;
  String? text;
  int? rating;
  String? roomId;

  Review({this.reviewId, this.text, this.rating, this.roomId});

  Review.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    text = json['text'];
    rating = json['rating'];
    roomId = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review_id'] = reviewId;
    data['text'] = text;
    data['rating'] = rating;
    data['room_id'] = roomId;
    return data;
  }
}
