import 'dart:developer';
import 'package:project2/models/hotel.dart';
import 'package:project2/models/room.dart';
import 'package:project2/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final client = Supabase.instance.client;

  Future<List<UserModel>?> getUser() async {
    log('message');
    final supabase = Supabase.instance.client; // ! it Does Not Work
    log('test');
    final rawUser = await supabase.from('user').select();
    log(rawUser.toString());
    final List<UserModel> users = [];
    for (final user in rawUser) {
      users.add(UserModel.fromJson(user));
    }
    return users;
  }

  Future<List<Hotel>?> getHotel() async {
    final supabase = Supabase.instance.client;
    final rawHotel = await supabase.from('hotel').select();
    final List<Hotel> hotels = [];
    for (final hotel in rawHotel) {
      hotels.add(Hotel.fromJson(hotel));
    }
    return hotels;
  }

  Future<Room?> getRoomsByHoteleId(String roomId) async {
    final supabase = Supabase.instance.client;
    final rawRoom = await supabase.from('room').select().match({
      "room_id" : roomId
    });
    return Room.fromJson(rawRoom[0]);
  }

//   Future insertCourse(Course course) async {
//     final supabase = Supabase.instance.client;
//      await supabase.from('course').insert(course.toJson());
//   }

//     Future deleteCourse(String courseId) async {
//     final supabase = Supabase.instance.client;
//      await supabase.from('course').delete().eq('course_id', courseId);
//   }

  // Future<List<Course>?> getInstructors() async {
  //   final supabase = Supabase.instance.client;
  //   final rawCourses = await supabase.from('instructor').select('name, course_id, image_url');
  //   final List<Course> courses = [];
  //   for (final course in rawCourses) {
  //     courses.add(Course.fromJson(course));
  //   }
  //   return courses;
  // }
}
