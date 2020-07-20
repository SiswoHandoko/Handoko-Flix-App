part of 'theme_bloc.dart';

//THEME INI UNTUK MERUBAH WARNA DARI BORDER INPUT TEXT DI PAGE LOGIN
class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(this.themeData);

  @override
  List<Object> get props => [themeData];
}
