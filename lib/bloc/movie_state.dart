part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final List<MovieModel> movie;
  MovieLoaded({this.movie});

  @override
  // TODO: implement props
  List<Object> get props => [movie];

}
