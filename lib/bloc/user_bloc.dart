import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mov_tix/models/models.dart';
import 'package:mov_tix/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  @override
  // TODO: implement initialState
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is LoadUser){
      User user = await UserServices.getUser(event.id);

      yield UserLoaded(user);
    } else if(event is SignOut){
      yield UserInitial();
    }
  }

}
