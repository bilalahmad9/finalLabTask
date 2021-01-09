import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Sign_in.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key key,
    @required this.user
}) : super(key: key);
  final UserCredential user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Note Taking App'),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
