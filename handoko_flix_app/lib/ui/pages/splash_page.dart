part of "pages.dart";

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //LOGO FLUTIX
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            //NEW EXPERIENCE TEXT
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "Pengalaman Baru",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              "Tonton Film Terbaru Dengan Pengalaman\n Yang Lebih Baik Dari Biasanya",
              style: greyTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 70, bottom: 19),
              child: RaisedButton(
                child: Text(
                  "Mulai",
                  style: whiteTextFont.copyWith(fontSize: 16),
                ),
                color: mainColor,
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Anda Telah Memiliki Akun? ",
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  },
                  child: Text(
                    "Masuk",
                    style: purpleTextFont,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
