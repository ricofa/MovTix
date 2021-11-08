import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mov_tix/models/models.dart';
import 'package:mov_tix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {


  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if(event is FetchMovie){
      List<MovieModel> movie = await MovieServices.getMovies(1);
      yield MovieLoaded(movie: movie);
    }
  }

  @override
  // TODO: implement initialState
  MovieState get initialState => MovieInitial();
}
