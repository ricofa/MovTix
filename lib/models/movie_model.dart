part of 'models.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final double ratingMovie;
  final String overview;
  final String poster;
  final String backdrop;

  MovieModel(
      {@required this.id,
      @required this.title,
      @required this.overview,
      @required this.poster,
      @required this.backdrop,
      @required this.ratingMovie});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      poster: json['poster_path'],
      backdrop: json['backdrop_path'],
      ratingMovie: (json['vote_average'] as num).toDouble());

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, title, ratingMovie, overview, poster, backdrop];
}
