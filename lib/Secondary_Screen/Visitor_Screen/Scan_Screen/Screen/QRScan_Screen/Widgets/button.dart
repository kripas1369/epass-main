import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';


class ScanDefaultButton extends StatelessWidget {
  const ScanDefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press as void Function()?,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.87,
        height:45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
         color:    nextbuttonColor,
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: (20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
class ScanWhiteDefaultButton extends StatelessWidget {
  const ScanWhiteDefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press as void Function()?,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.83,
        height:45,
        decoration: BoxDecoration(
          border: Border.all(
            color:primaryColor, // Specify the border color here
            width: 1.0, // Specify the border width here
          ),
          borderRadius: BorderRadius.circular(5),
          color:    Colors.white,
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: (20),
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}