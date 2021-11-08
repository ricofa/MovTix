part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage(this.registerModel);

  @override
  _SignUpPageState createState() => _SignUpPageState();

  final RegisterModel registerModel;
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = widget.registerModel.name;
    emailController.text = widget.registerModel.name;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
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
                  margin: EdgeInsets.only(top: 20, bottom: 22),
                  height: 55,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Create New\nAccount",
                          style: blackFont.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 104,
                  child: Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    (widget.registerModel.profileImage == null)
                                        ? AssetImage("assets/user_pic.png")
                                        : FileImage(
                                            widget.registerModel.profileImage),
                                fit: BoxFit.cover)),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            if (widget.registerModel.profileImage == null) {
                              widget.registerModel.profileImage =
                                  await getImage();
                            } else {
                              widget.registerModel.profileImage = null;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        (widget.registerModel.profileImage ==
                                                null)
                                            ? "assets/btn_add_photo.png"
                                            : "assets/btn_del_photo.png"))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Full Name",
                    hintText: "Full Name",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email Address",
                    hintText: "Email Address",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  obscureText: true,
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Confirm Password",
                    hintText: "Confirm Password",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: mainColor,
                  onPressed: () {
                    if (!(nameController.text.trim() != "" &&
                        emailController.text.trim() != "" &&
                        passwordController.text.trim() != "" &&
                        newPasswordController.text.trim() != "")) {
                      Flushbar(
                        duration: Duration(milliseconds: 1500),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Please Fill All The Fields",
                      )..show(context);
                    } else if(passwordController.text != newPasswordController.text){
                      Flushbar(
                        duration: Duration(milliseconds: 1500),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Password and Confirm Password Not Same",
                      )..show(context);
                    } else if(passwordController.text.length < 6){
                      Flushbar(
                        duration: Duration(milliseconds: 1500),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Password's Min 6 Character",
                      )..show(context);
                    } else if(!EmailValidator.validate(emailController.text)){
                      Flushbar(
                        duration: Duration(milliseconds: 1500),
                        flushbarPosition: FlushbarPosition.TOP,
                        backgroundColor: Color(0xFFFF5C83),
                        message: "Wrong The Email Address Format",
                      )..show(context);
                    } else {
                      widget.registerModel.name = nameController.text;
                      widget.registerModel.email = emailController.text;
                      widget.registerModel.password = passwordController.text;

                      context.bloc<PageBloc>().add(GoToPreferencePage(widget.registerModel));
                    }
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
