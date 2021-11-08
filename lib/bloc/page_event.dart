part of 'page_bloc.dart';

@immutable
abstract class PageEvent extends Equatable{
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegisterPage extends PageEvent {
  final RegisterModel registerModel;
  GoToRegisterPage(this.registerModel);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegisterModel registerModel;
  GoToPreferencePage(this.registerModel);

  @override
  List<Object> get props => [];
}

class GoToConfirmationAccountPage extends PageEvent {
  final RegisterModel registerModel;
  GoToConfirmationAccountPage(this.registerModel);

  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final MovieModel movieModel;
  GoToMovieDetailPage(this.movieModel);

  @override
  List<Object> get props => [movieModel];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetail movieDetail;
  GoToSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class GoToSelectSeatPage extends PageEvent {
  final Ticket ticket;
  GoToSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}