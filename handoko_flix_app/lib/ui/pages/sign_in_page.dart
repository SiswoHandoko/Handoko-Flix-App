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

    return Scaffold(
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
                TextField(
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
                TextField(
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
                    child: FloatingActionButton(
                        child: Icon(Icons.arrow_forward),
                        backgroundColor: mainColor,
                        onPressed: () {}),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Mulai Sekarang? ",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
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
    );
  }
}
