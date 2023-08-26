import 'package:flutter/material.dart';
import 'package:project2/constants/app_styles.dart';
import 'package:project2/services/supabase.dart';
import 'package:project2/components/general/card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [primaryColor, darkPrimaryColor])),
        ),
      ),
      // drawer: const Drawer(),
      body: FutureBuilder(
          future: SupabaseService().getHotel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data ?? [];
              return GridView.builder(
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 400, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return CardWidget(
                      hotel: list[index],
                    );
                  });
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}


/*


CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 220,
            toolbarHeight: 120,
            backgroundColor: primaryColor,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const TextWidget(
                text: "All Hotels",
                color: whiteColor,
              ),
              background: Image.network(
                "https://news.clemson.edu/wp-content/uploads/2021/06/science-fish-41067725.jpg",
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
            ),
          ),

SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: TextWidget(text: "Item ${1 + index}"),
                );
              },
              childCount: 30,
            ),
          ),

*/


/*

ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder(
            future: SupabaseService().getUser(),
            builder: (context, snapshot) {
              print("is data ${snapshot.hasData}");
              if (snapshot.hasData) {
                final list = snapshot.data ?? [];
                print(list);
                return GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  children: [
                    for (final user in list) ...[
                      Container(
                        color: Colors.green,
                        child: Text(
                          user.name.toString()
                        ),
                      ),
                    ]
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),

      */