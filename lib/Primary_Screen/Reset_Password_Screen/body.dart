import 'package:flutter/material.dart';

import '../Reset_Password_Screen/Screen/reset_password_Screen.dart';


class ResetPassword extends StatelessWidget {
  final String otp;
  final String mobilenumber;
  ResetPassword({required this.otp,required this.mobilenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
            child: Body(otp: otp, mobilenumber: mobilenumber,)
        ));
  }
}
