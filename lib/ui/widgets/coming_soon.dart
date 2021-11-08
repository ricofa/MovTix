part of 'widgets.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon(this.movieModel, {this.onTap});

  final MovieModel movieModel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(imageBaseUrl + "w500" + movieModel.backdrop),
              fit: BoxFit.cover)),
    );
  }
}