import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Reset_Password_Screen/Widgets/reset_widgets.dart';

import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';


class Body extends StatelessWidget {
  final String mobilenumber;
  final String otp;
  Body({required this.otp,required this.mobilenumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.appbarLogo,),
          CustomSizeBox(width: 0,),
          // CustomHeading(text: 'RESET PASSWORD'),
          CustomHeading(text: 'Reset Password'),
          CustomSubHeading(text: 'Please enter and confirm new password to change.'),


          ///TEXTFIELD WIDGET START
          ResetTextfield(mobilenumber: mobilenumber, otp:otp,),
          TextSizeBox(),
          TextSizeBox(),
          ///TEXTFIELD WIDGET END


        ],),
    );
  }
}
