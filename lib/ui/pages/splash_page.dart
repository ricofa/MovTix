part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 136,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 30),
                child: Text(
                  "New Experience",
                  style: blackFont.copyWith(fontSize: 20),
                ),
              ),
              Text(
                "Watch a new movie much\neasier than any before",
                style: greyFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: EdgeInsets.only(top: 70, bottom: 19),
                child: RaisedButton(
                  child: Text(
                    "Get Started",
                    style: whiteFont.copyWith(fontSize: 16),
                  ),
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account? ",
                    style: greyFont.copyWith(fontWeight: FontWeight.w300),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.bloc<PageBloc>().add(GoToLoginPage());
                    },
                      child: Text("Sign in", style: purpleFont))
                ],
              ),
            ],
          )),
    );
  }
}
