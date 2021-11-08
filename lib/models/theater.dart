part of 'models.dart';

class Theater extends Equatable{
  final String name;

  Theater(this.name);

  @override
  // TODO: implement props
  List<Object> get props => [name];

}

List<Theater> dummyTheater = [
  Theater("Golden Kediri"),
  Theater("XXI Kediri Mall"),
  Theater("CGV Ramayana Kediri"),
  Theater("CGV Ramayana Tulungagung"),
];