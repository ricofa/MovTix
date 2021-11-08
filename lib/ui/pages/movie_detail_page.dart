part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieModel movieModel;

  const MovieDetailPage(this.movieModel);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<CreditModel> credits;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: accentColor1,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: [
                FutureBuilder(
                    future: MovieServices.getDetailsMovie(movieModel),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        movieDetail = snapshot.data;
                      }
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Stack(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 270,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(imageBaseUrl +
                                                    "w1280" +
                                                    movieModel.backdrop ??
                                                movieModel.poster),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 271,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment(0, 1),
                                            end: Alignment(0, 0.6),
                                            colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0)
                                        ])),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: defaultMargin),
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black.withOpacity(0.04)),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToMainPage());
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Text(
                                movieModel.title,
                                style: blackFont.copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              )),
                          SizedBox(
                            height: 6,
                          ),
                          (snapshot.hasData)
                              ? Text(
                                  movieDetail.genreLanguage,
                                  style: greyFont.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              : SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: SpinKitFadingCircle(
                                    color: accentColor3,
                                  ),
                                ),
                          SizedBox(
                            height: 6,
                          ),
                          RatingMovie(
                            rating: movieModel.ratingMovie,
                            color: accentColor3,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 12),
                              child: Text(
                                "Cast & Crew",
                                style: blackFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          FutureBuilder(
                            future: MovieServices.getCredits(movieModel.id),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                credits = snapshot.data;
                                return SizedBox(
                                  height: 115,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: credits.length,
                                      itemBuilder: (_, index) => Container(
                                            margin: EdgeInsets.only(
                                                left: (index == 0)
                                                    ? defaultMargin
                                                    : 0,
                                                right: (index ==
                                                        credits.length - 1)
                                                    ? defaultMargin
                                                    : 16),
                                            child: CreditCard(credits[index]),
                                          )),
                                );
                              } else {
                                return SizedBox(
                                  height: 50,
                                  child: SpinKitFadingCircle(
                                    color: accentColor1,
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 8),
                              child: Text(
                                "Storyline",
                                style: blackFont.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 30),
                              child: Text(
                                movieModel.overview,
                                style: greyFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: mainColor,
                            child: Text(
                              "Continue to Book",
                              style: whiteFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToSelectSchedulePage(movieDetail));
                            },
                          ),
                          SizedBox(
                            height: defaultMargin,
                          )
                        ],
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
