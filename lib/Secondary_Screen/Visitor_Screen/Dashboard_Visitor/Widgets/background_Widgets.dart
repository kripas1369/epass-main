import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/body_Widget.dart';

class BackgroundWidgets extends StatelessWidget {
  const BackgroundWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 430,
          height: 10.23,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment(-1.00, 0.04),
              begin: Alignment(1, -0.04),
              colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
            ),
          ),
      child: Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.topdot,
          fit: BoxFit.cover,
        ),
      ),
        ),
        Expanded(
          child: Container(
            color: Color(0xFFF4F4F4),
            width: double.infinity,
            child: DashBody(),
          ),
        ),
      ],
    );
  }
}
