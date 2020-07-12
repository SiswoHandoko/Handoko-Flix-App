part of "services.dart";

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // SERVICE UNTUK SIGN UP USER KE FIRESTORE DAN FIREBASE AUTH
  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
    }
  }

  // SERVICE UNTUK SIGN IN USER
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      // Memanggil Firebase Method untuk sign in dengan email + password
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      //Memanggil firebase user extension untuk mendapatkan user
      User user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
    }
  }

  // SERVICE UNTUK SIGN OUT USER
  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
