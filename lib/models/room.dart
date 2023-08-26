class Room {
  String? roomId;
  double? price;
  String? description;
  String? imageUrl;

  Room({this.roomId, this.price, this.description, this.imageUrl});

  Room.fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    price = json['price'].toDouble();
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_id'] = roomId;
    data['price'] = price;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
