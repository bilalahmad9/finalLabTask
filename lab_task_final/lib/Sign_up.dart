import 'package:flutter/material.dart';
import 'StylesScreen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: ClippingClass(),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.orange,
                    Colors.deepOrange,
                  ]),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: Offset(0,4),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 35), // giving padding only the left and right side
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      style: simpleTextFieldStyle(),
                      decoration: textfieldInputDecoration("username"),
                    ),
                    TextField(
                      style: simpleTextFieldStyle(),
                      decoration: textfieldInputDecoration("email"),
                    ),
                    TextField(
                      style: simpleTextFieldStyle(),
                      decoration: textfieldInputDecoration("password"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Forgot Password?",
                          style: simpleTextFieldStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.deepOrange,
                          Colors.orange,
                        ]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width - (size.width / 3), size.height - 40,
        size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}