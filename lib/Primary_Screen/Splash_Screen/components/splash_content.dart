import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Primary_Screen/Login_Screen/body.dart';
import 'package:pass/Primary_Screen/Splash_Screen/Widgets/circularButton.dart';

import '../../../Secondary_Screen/Organization_Screen/Widgets/button.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.details,
    this.title,
    this.image,
    required this.count,
  }) : super(key: key);

  final String? image, details, title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 10),
        Image.asset(
          image!,
          width: 350,
          height: 360,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
          child: Container(
            width: double.infinity,
            height: 350.19,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Spacer(flex: 4),
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF090A0A),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                Spacer(flex: 3),
                Text(
                  details!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF090A0A),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),

                Spacer(flex: 7),
                count == 2
                    ? GestureDetector(
                        onTap: () {
                          print("Clicked");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              end: Alignment(-0.97, 0.25),
                              begin: Alignment(0.97, -0.25),
                              colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                            ),
                            shape: CircleBorder(),
                          ),
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      )
                    : Container(),
                // Container(
                //   width: 60,
                //   height: 60,
                //   decoration: ShapeDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment(-1.00, -0.05),
                //       end: Alignment(1, 0.05),
                //       colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                //     ),
                //     shape: CircleBorder(),
                //   ),
                //   child: Center(
                //     child: RotatedBox(
                //       quarterTurns: 2,
                //       child: IconButton(
                //         onPressed: () {
                //           print("clickedddd");
                //           print("clickedddd");
                //           print("clickedddd");
                //         },
                //         icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
                Spacer(
                  flex: 2,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
