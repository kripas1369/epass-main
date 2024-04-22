import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

Decoration previewBoxDecoration(){
  return  BoxDecoration(
    boxShadow: [
      BoxShadow(
          color: Colors.black12,
        blurRadius: 12.0,
        spreadRadius: 1.0,
          offset: Offset(20.0, 9.0),
      )
    ],
      color:Color.fromRGBO(232, 230, 230, 1.0),
      borderRadius: BorderRadius.circular(7),
      // border: Border.all(color: primaryColor, width: 0.4)
  );
}