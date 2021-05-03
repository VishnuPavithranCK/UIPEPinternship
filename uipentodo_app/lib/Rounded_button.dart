import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
RoundedButton({this.buttonName,this.kcolor,this.onPressed});
Color kcolor;
Function onPressed;
String buttonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:100,vertical: 16),
      child: Material(
        color: kcolor,
        borderRadius: BorderRadius.circular(30),
        elevation: 5,


        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            child: Text(buttonName),
            textColor: Colors.black,
            height: 42,


          ),
        ),
      ),
    );
  }
}