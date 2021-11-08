part of 'page_bloc.dart';

@immutable
abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegisterPage extends PageState {
  final RegisterModel registerModel;
  OnRegisterPage(this.registerModel);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegisterModel registerModel;
  OnPreferencePage(this.registerModel);

  @override
  List<Object> get props => [];
}

class OnConfirmationAccountPage extends PageState {
  final RegisterModel registerModel;
  OnConfirmationAccountPage(this.registerModel);

  @override
  List<Object> get props => [];
}

class OnMovieDetailPage extends PageState {
  final MovieModel movieModel;
  OnMovieDetailPage(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}

class OnSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;
  OnSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnSelectSeatPage extends PageState {
  final Ticket ticket;
  OnSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}
