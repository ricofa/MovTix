part of 'models.dart';

class CreditModel extends Equatable{
  final String name;
  final String profile;

  CreditModel({this.name, this.profile});

  @override
  // TODO: implement props
  List<Object> get props => [name, profile];

}