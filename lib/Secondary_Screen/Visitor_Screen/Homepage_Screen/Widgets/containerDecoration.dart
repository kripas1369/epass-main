import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

Decoration homepageBoxDecoration(){
  return  BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 12.0,
        spreadRadius: 1.0,
        offset: Offset(6.0, 5.0),
      )
    ],
    color:khomeboxcolor,
    borderRadius: BorderRadius.circular(7),
    // border: Border.all(color: primaryColor, width: 0.4)
  );
}
Decoration homepageSecBoxDecoration(){
  return  BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 12.0,
        spreadRadius: 1.0,
        offset: Offset(6.0, 5.0),
      )
    ],
    color:Shomeboxcolor,
    borderRadius: BorderRadius.circular(7),
    // border: Border.all(color: primaryColor, width: 0.4)
  );
}