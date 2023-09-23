import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switching_screen/IntroPage.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroPage()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.deepPurpleAccent,
        child: Center(
            child: Text(
          'Welcome',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
