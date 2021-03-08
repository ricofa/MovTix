part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedLanguage: selectedLanguage,
          selectedGenres: selectedGenres);
    } catch (e) {}
  }
}
