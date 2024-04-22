import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Login_Screen/body.dart';

import '../components/splash_content.dart';

class SplashScreenOne extends StatefulWidget {
  @override
  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "details":
          "Unlock the next level of convenience by \n embracing the cutting-edge technology of QR \n codes for seamless entry.",
      "image": AppImages.frame1,
      "title": "Experience the Epass \n revolution for entry"
    },
    {
      "details":
          "Embrace a faster, safer, and more convenient \n entry process with our QR-Based Entry System, \n eliminating the hassle of paperwork.",
      "image": AppImages.frame2,
      "title": "Cut out manual \n processes, save time!"
    },
    {
      "details":
          "Experience the convenience of effortless entry with just a simple scan, confirmation, and voila! Discover remarkable power of QR technology.",
      "image": AppImages.frame3,
      "title": "Experience the \n ease of our QR Entry System!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment(-0.97, 0.25),
            begin: Alignment(0.97, -0.25),
            colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
          ),
        ),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppImages.topdot,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                AppImages.downdot,
                fit: BoxFit.cover,
              ),
            ),
            PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                count: index,
                details: splashData[index]["details"],
                title: splashData[index]["title"]?.toUpperCase(),
                image: splashData[index]["image"],
              ),
            ),
            Positioned(
              bottom: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "skip >>",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? nextbuttonColor : Color(0xFFA2A2A2),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
