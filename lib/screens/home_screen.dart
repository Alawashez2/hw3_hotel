import 'package:flutter/material.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/extensions/navigator.dart';
import 'package:project2/models/user.dart';
import 'package:project2/screens/reservation_screen.dart';
import 'package:project2/services/supabase.dart';
import 'package:project2/components/general/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? check = false;
  bool? check2 = false;
  bool? check3 = false;
  bool? check4 = false;
  String paris = "";
  String london = "";
  String newYork = "";
  String dubai = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            context.push(const ReservationScreen());
          },
          icon: const Icon(Icons.book_rounded),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [primaryColor, darkPrimaryColor])),
        ),
      ),
      // drawer: const Drawer(),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                CheckboxListTile(
                  value: check,
                  onChanged: (bool? value) {
                    setState(() {
                      check = value;
                      paris = check! ? "Paris" : "";
                    });
                  },
                  title: const Text("Paris"),
                ),
                CheckboxListTile(
                  value: check2,
                  onChanged: (bool? value) {
                    setState(() {
                      check2 = value;
                      london = check2! ? "London" : "";
                    });
                  },
                  title: const Text("London"),
                ),
                CheckboxListTile(
                  value: check3,
                  onChanged: (bool? value) {
                    setState(() {
                      check3 = value;
                      newYork = check3! ? "New York" : "";
                    });
                  },
                  title: const Text("New York"),
                ),
                CheckboxListTile(
                  value: check4,
                  onChanged: (bool? value) {
                    setState(() {
                      check4 = value;
                      newYork = check4! ? "Dubai" : "";
                    });
                  },
                  title: const Text("Dubai"),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future:
                  SupabaseService().getHotels2(paris, london, newYork, dubai),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final list = snapshot.data ?? [];
                  return GridView.builder(
                      itemCount: list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 350, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          hotel: list[index],
                          user: widget.user,
                        );
                      });
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
