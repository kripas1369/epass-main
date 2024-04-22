import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Service/service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';
import 'package:telephony/telephony.dart';

class VerifyTextfield extends StatelessWidget {
  final String mobilenumber;
  VerifyTextfield({required this.mobilenumber});



  final _formKey = GlobalKey<FormState>();
  OtpFieldController otpbox = OtpFieldController();
  Telephony telephony = Telephony.instance;
  String otp = '';

  // OtpFieldController otpbox = OtpFieldController();
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),
          TextSizeBox(),

          // TextFieldText(text: 'OTP',),
          OTPTextField(
            outlineBorderRadius: 10,
            controller: otpbox,
            length: 6,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 50,
            style: TextStyle(fontSize: 25),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) {
              otp = pin;
            },
          ),
          // TextFormField(
          //     controller: otp,
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "Please Enter otp";
          //       }
          //       return null;
          //     },
          //     decoration:customPrefixDecoration("Please enter the received otp.", "",Icon(Icons.output))),

          TextSizeBox(),
          TextSizeBox(),
          DefaultButton(text: "Verify OTP",
            press: () async {

            if (_formKey.currentState!.validate()){

              VerifyOTP().
              optpostRegister(number: mobilenumber, otpnumber:otp, context: context


              );
                // Navigator.pushNamed(context, Routes.otpsuccess);
              }
            },
          ),

        ],
      ),
    );
  }
}