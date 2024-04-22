import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Widgets/verify_otp_forgotpws.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';

class ForgotBody extends StatelessWidget {
  final String mobilenumber;
  ForgotBody({required this.mobilenumber});


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
          CustomHeading(text: 'Verification'),
          TextSizeBox(),

          CustomSubHeading(text: 'The OTP has been sent to your email and \n mobile number.'),


          ///TEXTFIELD WIDGET START
          VerifyForgotPwsTextfield(mobilenumber: mobilenumber,),
          TextSizeBox(),
          TextSizeBox(),
          ///TEXTFIELD WIDGET END

      Text(
        "Resend Code",
        style: TextStyle(
            fontSize: 14,
            // color:Color.fromRGBO(0, 0, 0, 0.5),
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
        ],),
    );
  }
}
