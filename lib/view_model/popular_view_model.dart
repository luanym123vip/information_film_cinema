import 'package:information_film_cinema/api/api_servies.dart';
import 'package:information_film_cinema/item_movies/item_movie.dart';

class PopularViewModel {
  late ApiServies apiServies = ApiServies();
  late List<ItemMovies> movies = [];

  Future<void> initState() async {
    final list_movies = await apiServies.fetchMovies();
    movies = list_movies;
  }
}
