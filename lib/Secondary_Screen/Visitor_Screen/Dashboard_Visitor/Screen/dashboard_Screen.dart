import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/background_Widgets.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/body_Widget.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/header_Widget.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 430,
                  height: 140.23,
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
                HeaderWidget()
              ],
            ),
              DashBody(),
            // Expanded(
            //   child: Container(
            //     color: Color(0xFFF4F4F4),
            //     width: double.infinity,
            //     child: DashBody(),
            //   ),
            // ),
          ],
        ),
      );
    // return Stack(
    //   children: <Widget>[
    //     BackgroundWidgets(),
    //     Positioned(
    //       top: 50,
    //       right: 20,
    //       child: HeaderWidget()
    //     ),
    //   ],
    // );
  }
}
