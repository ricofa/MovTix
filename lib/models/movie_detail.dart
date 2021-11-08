part of 'models.dart';

class MovieDetail extends MovieModel {
  final List<String> genres;
  final String language;

  MovieDetail(MovieModel movieModel, {this.genres, this.language})
      : super(
            id: movieModel.id,
            title: movieModel.title,
            ratingMovie: movieModel.ratingMovie,
            overview: movieModel.overview,
            poster: movieModel.poster,
            backdrop: movieModel.backdrop);

  String get genreLanguage {
    String s = "";
    for(var genre in genres){
      s += genre + (genre != genres.last ?', ' : '');
    }
    return "$s - $language";
  }

  @override
  // TODO: implement props
  List<Object> get props => super.props + [genres, language];
}
