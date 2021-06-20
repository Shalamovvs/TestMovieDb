import 'package:moviedb/models/Movie.dart';

class Answer {
  final int page;

  final List<Movie> result;

  Answer({
    required this.page,
    required this.result,
  });

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      page: map["page"],
      result: (map["results"] as List<dynamic>).map((item) => Movie.fromMap(item)).toList(),
    );
  }
}
