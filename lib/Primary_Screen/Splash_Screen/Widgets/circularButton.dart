import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Primary_Screen/Login_Screen/body.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const LoginScreen()),
    //     );
    //   },
    //   style: ElevatedButton.styleFrom(
    //     shape: CircleBorder(),
    //     padding: EdgeInsets.all(16.0),
    //     primary: Colors.blue, // Change the button color as needed
    //   ),
    //   child: RotatedBox(
    //     quarterTurns: 2,
    //     child: Icon(
    //       Icons.arrow_back_ios_sharp,
    //       size: 36.0,
    //       color: Colors.white, // Change the icon color as needed
    //     ),
    //   ),
    // );
      return Container(
        width: 60,
        height: 60,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.00, -0.05),
            end: Alignment(1, 0.05),
            colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
          ),
          shape: OvalBorder(),
        ),
        child: Center(
          child: RotatedBox(
            quarterTurns: 2,
              child:IconButton(
                onPressed: (){
                  print("clickedddd");
                },
                icon:Icon(Icons.arrow_back_ios_sharp,color: kprimarycolor,)),

              )
        ),
      );
  }
}
