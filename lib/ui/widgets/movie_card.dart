part of 'widgets.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movieModel, {this.onTap});

  final MovieModel movieModel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap();
        }
      },
      child: Container(
        height: 140,
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(imageBaseUrl + "w780" + movieModel.backdrop),
                fit: BoxFit.cover)),
        child: Container(
          height: 140,
          width: 210,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.61),
                Colors.black.withOpacity(0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieModel.title,
                style: whiteFont,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingMovie(
                rating: movieModel.ratingMovie,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
