import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget{
  var name;
  MyProfile(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.deepPurpleAccent,
          child: Center(child: Text('Welcome $name', style: TextStyle(color: Colors.white, fontSize: 30),)),
        ),
      ),
    );
  }

}