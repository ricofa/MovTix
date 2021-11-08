part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent{
  final String id;

  LoadUser(this.id);
  @override
  // TODO: implement props
  List<Object> get props => [id];
}

class SignOut extends UserEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class UpdateProfile extends UserEvent{
  final String name;
  final String profileImage;

  UpdateProfile({this.name, this.profileImage});
  @override
  // TODO: implement props
  List<Object> get props => [name, profileImage];
}