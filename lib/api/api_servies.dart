import 'package:information_film_cinema/api/api_url.dart';
import 'package:information_film_cinema/item_movies/item_movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServies {
  Future<List<ItemMovies>> fetchMovies() async {
    var UrlApiMovies = ApiUrl().movies;
    List<ItemMovies> list_movies = [];
    try {
      var response;
      response = await http.get(UrlApiMovies);
      var body = json.jsonDecode(response.body);
      final results = body["results"];
      if (results != []) {
        for (var jsonItem in results) {
          ItemMovies movies = ItemMovies.fromJson(jsonItem);
          list_movies.add(movies);
        }
      }
      return list_movies;
    } catch (e) {
      print(e.toString());
    }
    return list_movies;
  }
}
