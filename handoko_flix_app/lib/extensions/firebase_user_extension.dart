part of "extension.dart";

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {String name = "Tidak Ada Nama",
          List<String> selectedGenres = const [],
          String selectedLanguage = "Bahasa",
          int balance = 100000}) =>
      User(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          balance: balance);
}
