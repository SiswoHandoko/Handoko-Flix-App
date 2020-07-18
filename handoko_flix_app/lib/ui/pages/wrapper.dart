part of "pages.dart";

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //mendapatkan status firebase user
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    if (firebaseUser == null) {
      //Untuk Handle Page Ter Load 2 kali ketika ada 2 kali balikan dr Firebase auth
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        //load user data
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    //Pengecekan Kondisi untuk load page
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage) ? SignInPage() : MainPage());
  }
}
