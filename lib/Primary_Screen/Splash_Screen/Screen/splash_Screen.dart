import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Splash_Screen/Screen/splash_Screen1.dart';
import 'package:pass/Primary_Screen/Splash_Screen/components/splash_content.dart';
import 'dart:async';

import 'package:pass/routes.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashScreenOne()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment(-0.97, 0.25),
          begin: Alignment(0.97, -0.25),
          colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
        ),
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              AppImages.topdot,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          ScaleTransition(
            scale: _animation,
            child: Image.asset(AppImages.logo),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.downdot,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
