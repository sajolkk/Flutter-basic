import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle mTextStyle1(){
  return TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
}
TextStyle mTextStyle2({ Color textColor= Colors.black, FontWeight fontWeight= FontWeight.normal}){
  return TextStyle(
    fontSize: 25,
    color: textColor,
    fontWeight: fontWeight,
  );
}