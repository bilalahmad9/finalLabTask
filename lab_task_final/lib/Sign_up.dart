import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'Home.dart';
import 'Sign_in.dart';

class signup extends StatefulWidget {


  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  height: 380,
                  width: 300,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[

                          TextFormField(
                            decoration: InputDecoration(labelText: 'Enter Name'),
                            keyboardType: TextInputType.text,
                            validator: (value) {},
                          //  onSaved: (value) => _email = value,
                          ),
                          // For email
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                          ),
                          // for password
                          TextFormField(
                            decoration: InputDecoration(labelText: 'password'),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty || value.length <= 4) {
                                return 'please enter more than 4 words';
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          RaisedButton(
                            onPressed: SignUp,
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.orange,
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => signin(), fullscreenDialog: true,
                                ),
                              );
                            },
                            child: Text(
                              'Login Now',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.orange,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> SignUp() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user.credential;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  HomeScreen(),
          ),
        );
      } catch (e) {
        print(e.message);
      }
    }
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

