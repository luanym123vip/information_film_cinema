import 'package:flutter/material.dart';
import 'package:information_film_cinema/movies_screen_page/popular_screen_page/popular_screen.dart';
import 'package:information_film_cinema/view_model/popular_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PopularViewModel movies_view_model = PopularViewModel();
  // late TabController controller;
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Popular'),
    const Tab(text: 'Nowplaying'),
    const Tab(text: 'Up Coming'),
  ];

  @override
  void initState() {
    super.initState();
    movies_view_model.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Film Cinema",
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Comfortaa'),
              ),
              bottom: TabBar(
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                tabs: tabs,
              ),
            ),
            body: FutureBuilder(
                future: movies_view_model.initState(),
                builder: (((context, snapshot) {
                  if ((snapshot.hasError) || (snapshot.hasData)) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return TabBarView(children: [
                    Container(
                      height: 585,
                      child: PopularScreen(movies: movies_view_model.movies),
                    ),
                    Container(
                      height: 585,
                      child: PopularScreen(movies: movies_view_model.movies),
                    ),
                    Container(
                      height: 585,
                      child: Column(
                        children: [
                          Image.network(
                              "https://img.freepik.com/free-vector/404-error-with-landscape-concept-illustration_114360-7968.jpg")
                        ],
                      ),
                    ),
                  ]);
                })))),
      ),
    );
  }
}
