import 'package:flutter/material.dart';

class VisitorButtons extends StatelessWidget {
  final String text;
  final Color color;
  const VisitorButtons({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width*0.27,
        height:35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:color
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
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        // ),
      );
  }
}