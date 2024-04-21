class ItemMovies {
  String? name;
  String? urlImg;
  String? releaseDate;
  String? backdrop_path;
  String? overview;
  ItemMovies({
    required this.name,
    required this.urlImg,
    required this.releaseDate,
    required this.backdrop_path,
    required this.overview,
  });

  String get getName => name!;
  String get getUrlImg => urlImg!;
  String get getReleaseDate => releaseDate!;
  String get getBackdrop_path => backdrop_path!;
  String get getOverview => overview!;

  factory ItemMovies.fromJson(json) {
    return ItemMovies(
        name: json["title"],
        urlImg: json["poster_path"],
        releaseDate: json["release_date"],
        backdrop_path: json["backdrop_path"],
        overview: json["overview"]);
  }

  toJson() {
    return {
      "title": name,
      "poster_path": urlImg,
      "release_date": releaseDate,
      "backdrop_path": backdrop_path,
      "overview": overview,
    };
  }
}
