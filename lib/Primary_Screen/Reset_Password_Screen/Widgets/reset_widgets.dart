import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Primary_Screen/Reset_Password_Screen/Service/service.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Service/service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';

class ResetTextfield extends StatefulWidget {
  final String mobilenumber;
  final String otp;

  ResetTextfield({required this.mobilenumber, required this.otp});

  @override
  State<ResetTextfield> createState() => _ResetTextfieldState();
}

class _ResetTextfieldState extends State<ResetTextfield> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;
    bool isbuttonClicked = false;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),

          TextFieldText(text: 'New Password',),
          SizedBox(height: 5,),

          TextFormField(
            controller: passwordController,
            obscureText: obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input your password";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "Input your password",
              "",
              Icon(Icons.lock_outline_sharp, color: Colors.grey,),
              obscurePassword,
                  () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
          ),
          TextSizeBox(),
          TextSizeBox(),

          TextFieldText(text: 'New Confirm Password',),
          SizedBox(height: 5,),
          TextFormField(
            controller: confirmPasswordController,
            obscureText: obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Input your password";
              } else if (value != passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "Input your password",
              "",
              Icon(Icons.lock_outline_sharp, color: Colors.grey,),
              obscurePassword,
                  () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
          ),
          TextSizeBox(),
          TextSizeBox(),
          TextSizeBox(),
          DefaultButton(
            text: "RESET PASSWORD",
            press: () async {
              if (_formKey.currentState!.validate()) {
                ResetService().service(
                  mobilenumber: widget.mobilenumber,
                  newpassword: passwordController.text,
                  otp: widget.otp,
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
