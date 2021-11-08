part of 'models.dart';

class Promo extends Equatable{
  final String title;
  final String subtitle;
  final int discount;

  Promo({@required this.title, @required this.subtitle,@required this.discount});

  @override
  // TODO: implement props
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> specialPromo = [
  Promo(title: "Summer Holiday", subtitle: "Maximal only for two person", discount: 50),
  Promo(title: "Family Holiday", subtitle: "Maximal for Four People", discount: 60),
  Promo(title: "Winter Holiday", subtitle: "Maximal only for two person", discount: 30)
];