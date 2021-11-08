part of 'widgets.dart';

class RatingMovie extends StatelessWidget {
  const RatingMovie({this.rating = 0, this.starSize = 20, this.fontSize = 12, this.color, this.mainAxisAlignment = MainAxisAlignment.start});

  final double rating;
  final double starSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    int rate = (rating / 2).round();

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < rate ? Icons.star : Icons.star_border_outlined,
              color: accentColor2,
              size: starSize,
            ));
    widgets.add(SizedBox(width: 3,));
    widgets.add(Text("$rating/10", style: whiteNumberFont.copyWith(color: color ?? Colors.white,fontWeight: FontWeight.w300, fontSize: fontSize),));

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: widgets,
    );
  }
}
