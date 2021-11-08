part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime dateTime;
  final Function onTap;

  const DateCard(this.dateTime,
      {this.isSelected = false, this.width = 70, this.height = 90, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? accentColor2 : Colors.transparent,
              border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dateTime.dayName,
                style: blackFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                dateTime.day.toString(),
                style: blackFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ));
  }
}
