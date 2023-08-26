class Hotel {
  String? hotelId;
  String? name;
  String? place;
  String? imageUrl;
  String? roomId;

  Hotel({this.hotelId, this.name, this.place, this.imageUrl, this.roomId});

  Hotel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    name = json['name'];
    place = json['place'];
    imageUrl = json['imageUrl'];
    roomId = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotel_id'] = hotelId;
    data['name'] = name;
    data['place'] = place;
    data['imageUrl'] = imageUrl;
    data['room_id'] = roomId;
    return data;
  }
}
