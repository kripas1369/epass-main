
import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';


class OrgWelcomeScreen extends StatelessWidget {
  const OrgWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome,',
                style: TextStyle(color:nextbuttonColor, fontSize: 23.0,fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "Tyson Canine.",
                style: TextStyle(color: Colors.black, fontSize: 18.0,fontStyle:FontStyle.italic,fontWeight: FontWeight.w500 ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.only(right: 90),
          child: Text("Thanks for selecting Epass as your Entry Management system! "
              "Please verify your organization to continue with the next steps.",style: TextStyle(
            color: primaryColor,fontWeight: FontWeight.w600
          ),),
        ),
        SizedBox(height: 20,),
        MaterialButton(
          color: nextbuttonColor,
          onPressed: (){
            Navigator.pushNamed(context, Routes.orgidentityScreen);
          },
          child: Text("Verify Organization",style: TextStyle(color: Colors.white),),),

        // NextButton(text: "Verify Organization",press: (){
        //   Navigator.pushNamed(context, Routes.identityScreen);
        // },),
      ],
    );
  }
}
