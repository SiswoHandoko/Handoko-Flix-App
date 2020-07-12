import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:handoko_flix_app/services/services.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("SignUp"),
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signUp(
                        "siswo.handoko@gmail.com",
                        "developer",
                        "Handoko",
                        ["Action", "Horor", "Music", "Drama"],
                        "Bahasa");

                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  }),
              RaisedButton(
                  child: Text("SignIn"),
                  onPressed: () async {
                    // Memanggil Auth services untuk Sign In
                    SignInSignUpResult result = await AuthServices.signIn(
                      "siswo.handoko@gmail.com",
                      "developer",
                    );

                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  })
            ],
          ),
        )));
  }
}
