import 'package:flutter/material.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Widgets/verify_otp_widgets.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';

class Body extends StatelessWidget {
  final String mobilenumber;
  Body ({required this.mobilenumber});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CustomSizeBox(width: 0,),
          CustomHeading(text: 'VERIFY OTP'),
          CustomSubHeading(text: 'Please enter the otp you have received on your registered number.'),


          ///TEXTFIELD WIDGET START
          VerifyTextfield(mobilenumber: mobilenumber,),
          TextSizeBox(),
          TextSizeBox(),
          ///TEXTFIELD WIDGET END

          // Center(child: InkWell(
          //     onTap: (){
          //       Navigator.pushNamed(context, Routes.forgotpsw);
          //     },
          //     child: CustomText(text:"Forgot Password ?",))),
          // TextSizeBox(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CustomText(text:"Already have an account?",),
          //     SizedBox(width: 5,),
          //     InkWell(
          //       onTap: (){
          //         Navigator.pushNamed(context, Routes.login);
          //       },
          //       child: Text("Login Now",
          //         style: TextStyle(decoration: TextDecoration.underline),),
          //     )
          //   ],
          // ),
          TextSizeBox(),
          TextSizeBox(),
        ],),
    );
  }
}
