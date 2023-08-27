class Reservation {
  String? reservationId;
  String? roomId;
  String? userId;
  String? hotelId;
  double? price;
  String? dateFrom;
  String? dateTo;
  int? days;

  Reservation(
      {this.reservationId,
      this.roomId,
      this.userId,
      this.hotelId,
      this.price,
      this.dateFrom,
      this.dateTo,
      this.days});

  Reservation.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservation_id'];
    roomId = json['room_id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    price = json['price'].toDouble();
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reservation_id'] = reservationId;
    data['room_id'] = roomId;
    data['user_id'] = userId;
    data['hotel_id'] = hotelId;
    data['price'] = price;
    data['date_from'] = dateFrom;
    data['date_to'] = dateTo;
    data['days'] = days;
    return data;
  }
}
