part of "models.dart";

class User extends Equatable {
  // Click Cmd + . untuk auto generate overriding
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  User(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.selectedGenres,
      this.selectedLanguage,
      this.balance});

  @override
  String toString() {
    // FUNGSI: Offeride dari super.toString(); menjadi
    return "[$id] - $name, $email";
  }

  @override
  // FUNGSI: implement props
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance
      ];
}
