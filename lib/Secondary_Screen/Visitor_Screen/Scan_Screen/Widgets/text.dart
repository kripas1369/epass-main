import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;

  HeadingText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24,
          color:Colors.blueAccent,
          fontWeight: FontWeight.w900
      ),
    );
  }
}
