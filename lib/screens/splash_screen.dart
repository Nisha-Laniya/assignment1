import 'dart:async';

import 'package:assignment1/screens/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null) {
      Timer(const Duration(seconds: 5),() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashBoardScreen())));
    } else {
      Timer(const Duration(seconds: 5),() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
          'assets/images/download.png',
      )
    );
  }
}
