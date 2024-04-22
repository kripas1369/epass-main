import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

class HeadingText extends StatelessWidget {
  final String text;

  HeadingText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF0F75BC),
        fontSize: 13,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
class CustomQrHeading extends StatelessWidget {
  final String text;

  CustomQrHeading({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 23,
        color: headTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
class CustomQrTitle extends StatelessWidget {
  final String text;

  CustomQrTitle({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 17,
        color: headTextColor,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}