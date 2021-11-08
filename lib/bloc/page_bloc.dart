 import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mov_tix/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if(event is GoToSplashPage){
      yield OnSplashPage();
    } else if(event is GoToLoginPage){
      yield OnLoginPage();
    } else if(event is GoToMainPage){
      yield OnMainPage();
    } else if(event is GoToRegisterPage){
      yield OnRegisterPage(event.registerModel);
    } else if(event is GoToPreferencePage){
      yield OnPreferencePage(event.registerModel);
    } else if(event is GoToConfirmationAccountPage){
      yield OnConfirmationAccountPage( event.registerModel);
    } else if(event is GoToMovieDetailPage){
      yield OnMovieDetailPage( event.movieModel);
    } else if(event is GoToSelectSchedulePage){
      yield OnSelectSchedulePage(event.movieDetail);
    } else if(event is GoToSelectSeatPage){
      yield OnSelectSeatPage(event.ticket);
    }
  }
}
