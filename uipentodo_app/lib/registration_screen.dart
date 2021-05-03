import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:uipentodo_app/login_screen.dart';
import 'constants.dart';
import 'package:uipentodo_app/Rounded_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = 'registraionScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String Email;
  String Password;
  bool spinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
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
                      text: "Plan Your Day!",
                      textStyle: GoogleFonts.play(fontSize: 50),
                      waveColor: Colors.white,
                      boxWidth: 400,
                      boxHeight: 100,
                      boxBackgroundColor: Colors.pink,
                    ),
                  ),
                ],
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
                    onChanged: (email) {
                      Email = email;
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
                        kInputDecoration.copyWith(hintText: 'New Password'),
                    onChanged: (password) {
                      Password = password;
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
                     final newUser = await _auth.createUserWithEmailAndPassword(
                         email: Email, password: Password);
                     if (newUser != null){
                       Navigator.pushNamed(context, LoginScreen.routeName);
                     }
                     setState(() {
                       spinner = false;
                     });
                   }catch(e){
                       print(e);
                   }
                    },
                    buttonName: 'Register',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text('Already have an Account?'),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "loginPage");
                        },
                        child: Text(
                          'Login',
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
