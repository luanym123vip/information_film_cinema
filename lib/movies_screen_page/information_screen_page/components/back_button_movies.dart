import 'package:flutter/material.dart';
import 'package:information_film_cinema/movies_screen_page/home_screen.dart';

class BackButtonMovies extends StatelessWidget {
  const BackButtonMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            )),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
            size: 25,
          ),
        )
      ],
    );
  }
}
