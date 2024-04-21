import 'package:flutter/material.dart';
import 'package:information_film_cinema/item_movies/item_movie.dart';
import 'package:information_film_cinema/movies_screen_page/home_screen.dart';
import 'package:information_film_cinema/movies_screen_page/information_screen_page/information_screen.dart';
import 'package:information_film_cinema/movies_screen_page/popular_screen_page/popular_stack_img.dart';

class PopularScreen extends StatelessWidget {
  final List<ItemMovies> movies;
  const PopularScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(22, 31, 22, 20),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.57,
        crossAxisCount: 2,
        crossAxisSpacing: 22.0, // cách ngang trong hàng giữa các đối tượng
        mainAxisSpacing: 30.0, // cách dọc trong hàng giữa các đối tượng
        // mainAxisExtent: 290,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return PopularStackImg(
          urlImg: "https://image.tmdb.org/t/p/w500" + movies[index].getUrlImg,
          name: movies[index].getName,
          releaseDate: movies[index].getReleaseDate,
          overview: movies[index].getOverview,
          context: context,
          ontap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InformationMoviesScreen(
                          movies: movies[index],
                        )));
          },
        );
      },
    );
  }
}
