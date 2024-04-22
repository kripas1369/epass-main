import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/text.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/text.dart';

class SuccessWidget extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  const SuccessWidget({Key? key, required this.image, required this.title, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeadingText(text: title),
          SizedBox(height: 15,),
          Image.asset(image),
          SizedBox(height: 20,),
          CustomSubHeading(text: desc,),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: DefaultButton(
              text: "GO BACK HOME",
              press: (){},
            ),
          ),
        ],
      ),
    );
  }
}
void showSnackBar(String message, Color color) {
  Get.snackbar(
    message,
    "",
    backgroundColor: color,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
  );
}
