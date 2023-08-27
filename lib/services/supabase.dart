import 'dart:developer';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/reservation.dart';
import 'package:project2/models/review.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final client = Supabase.instance.client;

  Future<UserModel>? getUser(String email) async {
    final supabase = Supabase.instance.client;
    final rawUser =
        await supabase.from('user').select().match({"email": email});
    return UserModel.fromJson(rawUser[0]);
  }

  Future<List<Hotel>?> getHotels2(String paris, String london, String newYork, String dubai) async {
    final supabase = Supabase.instance.client;
    final rawHotel = await supabase.from('hotel').select().or('place.eq.$paris,place.eq.$london,place.eq.$newYork,place.eq.$dubai');
    final List<Hotel> listHotels = [];
    for (final hotel in rawHotel) {
      listHotels.add(Hotel.fromJson(hotel));
    }
    return listHotels;
  }

  Future<Hotel>? getHotelById(String hotelId) async {
    final supabase = Supabase.instance.client;
    final rawHotel =
        await supabase.from('hotel').select().match({"hotel_id": hotelId});
    return Hotel.fromJson(rawHotel[0]);
  }

  Future<List<Reservation>?> getReservation() async {
    final supabase = Supabase.instance.client;
    final rawReservation = await supabase.from('reservation').select();
    log("raw : $rawReservation");
    final List<Reservation> listReservation = [];
    for (final item in rawReservation) {
      listReservation.add(Reservation.fromJson(item));
    }
    return listReservation;
  }

  Future<List<Review>?> getReviewByRoomId(String roomId) async {
    final supabase = Supabase.instance.client;
    final rawReview =
        await supabase.from('review').select().match({"room_id": roomId});
    print("raw : $rawReview");
    final List<Review> listReviews = [];
    for (final review in rawReview) {
      listReviews.add(Review.fromJson(review));
    }
    return listReviews;
  }

  Future<Room?> getRoomFromHoteleId(String roomId) async {
    final supabase = Supabase.instance.client;
    final rawRoom =
        await supabase.from('room').select().match({"room_id": roomId});
    return Room.fromJson(rawRoom[0]);
  }

  Future insertUser(UserModel user) async {
    final supabase = Supabase.instance.client;
    await supabase.from('user').insert(user.toJson());
  }

  Future insertReservation(Reservation reservation) async {
    final supabase = Supabase.instance.client;
    await supabase.from('reservation').insert(reservation.toJson());
  }

      Future deleteReservation(String reservationId) async {
    final supabase = Supabase.instance.client;
     await supabase.from('reservation').delete().eq('reservation_id', reservationId);
  }
}
