import 'package:flutter/material.dart';
import 'package:uipentodo_app/Rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:uipentodo_app/taskScreen.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginPage';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String LogEmail;
  String LoginPass;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(backgroundColor: Colors.pink,),
        color: Colors.pink,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: TextLiquidFill(
                      text: "Login",
                      textAlign: TextAlign.start,
                      textStyle: GoogleFonts.play(fontSize: 50),
                      waveColor: Colors.white,
                      boxWidth: 400,
                      boxHeight: 100,
                      boxBackgroundColor: Colors.pink,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.pink,
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Enter Email'),
                    onChanged: (login) {
                      LogEmail = login;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    cursorColor: Colors.pink,
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Enter Password'),
                    onChanged: (logpass) {
                      LoginPass = logpass;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedButton(
                    kcolor: Colors.white,
                    onPressed: () async{
                      setState(() {
                        spinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: LogEmail, password: LoginPass);
                        if (user != null){
                          Navigator.pushNamed(context, TaskScreen.routeName);
                        }
                        setState(() {
                          spinner =false;
                        });
                      }catch(e){
                         print(e);
                      }
                    },
                    buttonName: 'Login',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Don't have an Accunt?"),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "registraionScreen");
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
