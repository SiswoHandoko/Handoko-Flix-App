part of "services.dart";

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.name,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage
      // 'selectedPicture':user.selectedPicture ?? "" /** IF NULL THEN '' */
    });
  }
}
