import 'package:flutter/material.dart';
import 'package:information_film_cinema/item_movies/item_cast.dart';
import 'package:information_film_cinema/item_movies/item_movie.dart';
import 'package:information_film_cinema/movies_screen_page/information_screen_page/components/back_button_movies.dart';

class InformationMoviesScreen extends StatelessWidget {
  late ItemMovies movies;
  InformationMoviesScreen({
    super.key,
    required this.movies,
  });
  final List<ItemCast> listInforCast = [
    ItemCast(
      name: "Kelly Marie Tran",
      urlPhoto:
          "https://www.elleman.vn/app/uploads/2017/08/23/nu-dien-vien-hollywood-elle-man-1.jpg",
      character: "Raya (voice)",
    ),
    ItemCast(
      name: "Awkwafina",
      urlPhoto:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQntGHSdkJkBfxmQr22geEGLTbeBEtkyDM3UejU_Jl0Ag&s",
      character: "Sisu (voice)",
    ),
    ItemCast(
      name: "Izaac Wang",
      urlPhoto:
          "https://bazaarvietnam.vn/wp-content/uploads/2018/03/20180312-xu-huong-trang-diem-02.png",
      character: "Boun (voice)",
    ),
    ItemCast(
      name: "Gemma Chan",
      urlPhoto:
          "https://thammyhanquoc.vn/wp-content/uploads/2019/01/salma-hayek-nguc-khung-1.jpg",
      character: "Namaari (voice)",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _imageBackGround(context, movies),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: BackButtonMovies(),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _header(context: context, movies: movies)),
                const Padding(
                    padding: EdgeInsets.only(top: 20, left: 30),
                    child: Text(
                      "Cast",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                _cast(listInforCast),
                const Padding(
                    padding: EdgeInsets.only(top: 0, left: 30),
                    child: Text(
                      "Overview",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                _overview(
                  overview: movies.getOverview,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _imageBackGround(BuildContext context, ItemMovies movies) {
  return Container(
    child: Opacity(
      opacity: 0.2,
      child: Image.network(
        "https://image.tmdb.org/t/p/original" + movies.getBackdrop_path,
        fit: BoxFit.none,
        height: MediaQuery.of(context).size.height,
      ),
    ),
  );
}

Widget _header({required BuildContext context, required ItemMovies movies}) {
  List<Map<String, dynamic>> listInforCast;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            // height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500" + movies.getUrlImg,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          child: Column(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width) / 1.7,
                child: Text(
                  movies.getName,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) / 1.7,
                height: 140,
                child: Column(children: [
                  Container(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "Xuất bản: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 17, left: 5),
                          child: Text(
                            movies.getReleaseDate,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const Text(
                          "Thể loại: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.only(top: 17),
                          width: MediaQuery.of(context).size.width / 2.7,
                          child: Text(
                            "https://image.tmdb.org/t/p/w500" +
                                movies.getBackdrop_path,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _cast(List<ItemCast> inforCast) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    height: 200,
    child: ListView.builder(
        itemCount: inforCast.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: 200,
                width: 112,
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 112,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          inforCast[index].urlPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      inforCast[index].name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      inforCast[index].character,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
  );
}

Widget _overview({required String overview}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Text(
      overview,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Comfortaa',
      ),
    ),
  );
}
