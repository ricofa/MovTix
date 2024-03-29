part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  const PromoCard(this.promo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promo.title,
                    style: whiteFont,
                  ),
                  Text(
                    promo.subtitle,
                    style: whiteFont.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('OFF ',
                      style: yellowNumberFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w300)),
                  Text('${promo.discount}%',
                      style: yellowNumberFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 77.5, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 77.5, //height % size assets
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.asset("assets/reflection2.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                  .createShader(Rect.fromLTRB(0, 0, 96, 45)); // R: B%ukuran asset
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 45,
              width: 96, //height % size assets
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),),
                child: Image.asset("assets/reflection1.png"),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                  .createShader(Rect.fromLTRB(0, 0, 53, 25)); // R: B%ukuran asset
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 53, //height % size assets
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),),
                child: Image.asset("assets/reflection1.png"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
