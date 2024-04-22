import 'package:flutter/material.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Screen/verify_Otp_forgotpws.dart';

import '../Verify_Otp_Screen/Screen/verify_Otp.dart';



class VerifyOtp extends StatelessWidget {
  final String mobilenumber;
  VerifyOtp({required this.mobilenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
            child: Body(mobilenumber: mobilenumber,)
        ));
  }
}

class VerifyOtpForgotPws extends StatelessWidget {
  final String mobilenumber;
  VerifyOtpForgotPws ({required this.mobilenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
            child: ForgotBody(mobilenumber: mobilenumber,)
        ));
  }
}
