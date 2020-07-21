part of "pages.dart";

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Mendifinisikan Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //Membuat Initial Variable
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    //merubah warna border input text
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      //Bungkus Scaffold dgn WillPopScope untuk trigger back button ke page splash screen
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30, //MARGIN DARI STATUS BAR
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset("assets/logo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      "Selamat Datang,\nJelajah!",
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                  //EMAIL
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Alamat Email",
                      hintText: "Alamat Email",
                    ),
                  ),
                  SizedBox(height: 16),
                  //PASSWORD
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        //VALIDASI JIKA PASSWORD >= 6 MAKA DIANGGAP VALID
                        isPasswordValid = text.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: true, // TYPE PASSWORD UNTUK HIDE INPUT AN
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Kata Sandi",
                      hintText: "Kata Sandi",
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Lupa Kata Sandi? ",
                        style: greyTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Dapatkan Sekarang",
                        style: purpleTextFont.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isSigningIn
                          ? SpinKitFadingCircle(color: mainColor)
                          : FloatingActionButton(
                              elevation: 0, //AGAR FLAT TIDAK ADA BAYANGAN
                              child: Icon(
                                Icons.arrow_forward,
                                color: isEmailValid && isPasswordValid
                                    ? Colors.white
                                    : Color(0xFFBEBEBE),
                              ),
                              backgroundColor: isEmailValid && isPasswordValid
                                  ? mainColor
                                  : Color(0xFFE4E4E4),
                              onPressed: isEmailValid && isPasswordValid
                                  ? () async {
                                      //LOADING
                                      setState(() {
                                        isSigningIn = true;
                                      });
                                      //account siswo.handoko@gmail.com | developer
                                      SignInSignUpResult result =
                                          await AuthServices.signIn(
                                              emailController.text,
                                              passwordController.text);

                                      //PESAN ERROR
                                      if (result.user == null) {
                                        setState(() {
                                          isSigningIn = false;
                                        });
                                        //UNTUK MENAMPILKAN PESAN ERROR PAKE PACKAGE FLUSHBAR
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xFFFF5C83),
                                          message: result.message,
                                        )..show(context);
                                      }
                                    }
                                  : null),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Mulai Sekarang? ",
                        style:
                            greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Daftar",
                        style: purpleTextFont,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
