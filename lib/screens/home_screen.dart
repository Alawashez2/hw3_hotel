import 'package:flutter/material.dart';

import 'package:project2/components/text/text_widget.dart';
import 'package:project2/constants/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 160,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextWidget(text: "All Hotels",color: whiteColor,),
                  Container(
                    height: 30,
                    width: 120,
                    color: primaryColor,
                  )
                ],
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
        ],
      ),
    );
  }
}


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