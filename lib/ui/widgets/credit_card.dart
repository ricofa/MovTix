part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final CreditModel creditModel;
  const CreditCard(this.creditModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: (creditModel.profile == null)
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                          imageBaseUrl + "w185" + creditModel.profile),
                      fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
            width: 70,
            child: Text(
              creditModel.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style:
                  blackFont.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
            )),
      ],
    );
  }
}
