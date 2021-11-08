part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegisterModel registerModel;
  final List<String> genres = [
    "Horor","Music","Action","Drama","War","Crime"
  ];
  final List<String> languages = [
    "Bahasa","English","Japanese", "Korean"
  ];

  PreferencePage(this.registerModel) ;

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        widget.registerModel.password ="";
        context.bloc<PageBloc>().add(GoToRegisterPage(widget.registerModel));
        return;
      },
        child: Scaffold(
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 56,
                      margin: EdgeInsets.only(top: 20, bottom: 4),
                      child: GestureDetector(
                        onTap: (){
                          widget.registerModel.password ="";
                          context.bloc<PageBloc>().add(GoToRegisterPage(widget.registerModel));
                          return;
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Text(
                      "Select Your Four\nFavorite Genres",
                      style: blackFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateGenre(context),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Select Language\nYour Prefer",
                      style: blackFont.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateLanguage(context),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: FloatingActionButton(
                        elevation: 0,
                        backgroundColor: mainColor,
                        child: Icon(Icons.arrow_forward),
                        onPressed: (){
                          if(selectedGenres.length != 4){
                            Flushbar(
                              duration: Duration(milliseconds: 1500),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Please select 4 genres",
                            )..show(context);
                          } else {
                            widget.registerModel.selectLanguage = selectLanguage;
                            widget.registerModel.selectGenres = selectedGenres;
                            context.bloc<PageBloc>().add(GoToConfirmationAccountPage(widget.registerModel));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  List<Widget> generateGenre(BuildContext context){
    double width = (MediaQuery.of(context).size.width - 2 * defaultMargin-24)/2;
    
    return widget.genres.map((e) => SelectedBox(
      e,
      width: width,
      isSelected: selectedGenres.contains(e),
      onTap: () {
        onSelectGenre(e);
        },
    )).toList();
  }

  List<Widget> generateLanguage(BuildContext context){
    double width = (MediaQuery.of(context).size.width - 2 * defaultMargin-24)/2;

    return widget.languages.map((e) => SelectedBox(
      e,
      width: width,
      isSelected: selectLanguage == e,
      onTap: () {
        setState(() {
        selectLanguage = e;
        });
      },
    )).toList();
  }

  void onSelectGenre(String genre){
    if(selectedGenres.contains(genre)){
      setState(() {
        selectedGenres.remove(genre);
      });
    }else{
      if(selectedGenres.length < 4){
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
