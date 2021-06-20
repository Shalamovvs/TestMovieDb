class Movie {
  final num id;

  final String title;

  final String language;

  final String overview;

  final num popularity;

  final String poster;

  final String releaseDate;

  final num rating;

  Movie({
    required this.id,
    required this.title,
    required this.language,
    required this.overview,
    required this.popularity,
    required this.poster,
    required this.releaseDate,
    required this.rating
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map["id"],
      title: map["original_title"],
      language: map["original_language"],
      overview: map["overview"],
      popularity: map["popularity"],
      poster: map["poster_path"],
      releaseDate: map["release_date"],
      rating: map["vote_average"]
    );
  }
}
