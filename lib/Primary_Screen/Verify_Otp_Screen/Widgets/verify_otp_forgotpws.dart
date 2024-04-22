import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Service/service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:telephony/telephony.dart';

class VerifyForgotPwsTextfield extends StatelessWidget {
  final String mobilenumber;
  VerifyForgotPwsTextfield({required this.mobilenumber});

  final _formKey = GlobalKey<FormState>();
  OtpFieldController otpbox = OtpFieldController();
  Telephony telephony = Telephony.instance;
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),
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
          TextSizeBox(),
          TextSizeBox(),
          DefaultButton(
            text: "CONTINUE",
            press: () async {
              if (_formKey.currentState!.validate()){
                String otpnumber = otp;
                int OtpNumber = int.parse(otpnumber) ?? 0;

                VerifyOTP().optpostForgotPws(
                  number: mobilenumber,
                  otpnumber: OtpNumber.toString(),
                  context: context,
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
