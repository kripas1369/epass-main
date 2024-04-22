import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';


class NextButton extends StatelessWidget {
  const  NextButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height:40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:nextbuttonColor

        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}

class BackButtons extends StatelessWidget {
  const  BackButtons({
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
        width: MediaQuery.of(context).size.width * 0.35,
        height:40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:backbuttonColor
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     primaryColor,
          //     buttonColor,
          //     buttonColor,
          //     buttonColor,
          //   ],
          // ),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
