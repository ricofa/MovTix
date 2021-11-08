part of 'pages.dart';

class ConfirmationAccountPage extends StatefulWidget {
  final RegisterModel registerModel;
  const ConfirmationAccountPage(this.registerModel);

  @override
  _ConfirmationAccountPageState createState() =>
      _ConfirmationAccountPageState();
}

class _ConfirmationAccountPageState extends State<ConfirmationAccountPage> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToPreferencePage(widget.registerModel));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    height: 55,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToPreferencePage(widget.registerModel));
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
                            style: blackFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: (widget.registerModel.profileImage == null)
                                ? AssetImage("assets/user_pic.png")
                                : FileImage(widget.registerModel.profileImage),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "Welcome",
                    style: blackFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${widget.registerModel.name}",
                    textAlign: TextAlign.center,
                    style: blackFont.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSignUp)
                      ? SpinKitFadingCircle(
                          color: Colors.green,
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Create My Account",
                              style: whiteFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () async {
                              setState(() {
                                isSignUp = true;
                              });

                              imageUploadFile = widget.registerModel.profileImage;

                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registerModel.email,
                                      widget.registerModel.password,
                                      widget.registerModel.name,
                                      widget.registerModel.selectGenres,
                                      widget.registerModel.selectLanguage);

                              if(result.user == null){
                                setState(() {
                                  isSignUp = false;
                                });

                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: result.message,
                                )..show(context);
                              }
                            },
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
