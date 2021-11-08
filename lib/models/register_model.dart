part of 'models.dart';

class RegisterModel {
  String name;
  String email;
  String password;
  List<String> selectGenres;
  String selectLanguage;
  File profileImage;

  RegisterModel(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectGenres = const [],
      this.selectLanguage = "",
      this.profileImage});
}
