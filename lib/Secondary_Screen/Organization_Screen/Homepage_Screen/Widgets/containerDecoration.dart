import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

Decoration orghomepageBoxDecoration(){
  return  BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 12.0,
        spreadRadius: 1.0,
        offset: Offset(6.0, 5.0),
      )
    ],
    color:Color.fromRGBO(229, 236, 246, 1),
      // rgba(227, 245, 255, 1)
    borderRadius: BorderRadius.circular(7),
    // border: Border.all(color: primaryColor, width: 0.4)
  );
}
Decoration orghomepageSecBoxDecoration(){
  return  BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 12.0,
        spreadRadius: 1.0,
        offset: Offset(6.0, 5.0),
      )
    ],
    color:Color.fromRGBO(227, 245, 255, 1),

    borderRadius: BorderRadius.circular(7),
    // border: Border.all(color: primaryColor, width: 0.4)
  );
}