import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/Service/service.dart';
import 'package:pass/Primary_Screen/Reset_Password_Screen/Service/service.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/Service/service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';

class ChangePasswordTextfield extends StatefulWidget {
  @override
  State<ChangePasswordTextfield> createState() =>
      _ChangePasswordTextfieldState();
}

class _ChangePasswordTextfieldState extends State<ChangePasswordTextfield> {
  final _formKey = GlobalKey<FormState>();

  final oldpassword = TextEditingController();

  final conformpassword = TextEditingController();
  final newpassword = TextEditingController();

  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),
          TextFieldText(
            text: 'Old Password',
          ),
          TextFormField(
            obscureText: obscureOldPassword,
            controller: oldpassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Old Password";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "*****************",
              "",
              Icon(Icons.key),
              obscureOldPassword,
              () {
                // Toggle password visibility when the suffix icon is pressed
                setState(() {
                  obscureOldPassword = !obscureOldPassword;
                });
              },
            ),
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'New Password',
          ),
          TextFormField(
            controller: newpassword,
            obscureText: obscureNewPassword,
            // controller:conformpassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter New Password";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "*****************",
              "",
              Icon(Icons.key),
              obscureNewPassword,
              () {
                // Toggle password visibility when the suffix icon is pressed
                setState(() {
                  obscureNewPassword = !obscureNewPassword;
                });
              },
            ),
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'Conform New Password',
          ),
          TextFormField(
            controller: conformpassword,
            obscureText: obscureConPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Conform New Password";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "*****************",
              "",
              Icon(Icons.key),
              obscureConPassword,
              () {
                // Toggle password visibility when the suffix icon is pressed
                setState(() {
                  obscureConPassword = !obscureConPassword;
                });
              },
            ),
          ),
          TextSizeBox(),
          TextSizeBox(),
          TextSizeBox(),
          DefaultButton(
            text: "CHANGE PASSWORD",
            press: () async {
              if (_formKey.currentState!.validate()) {
                ChangePasswordService().service(
                    oldpassword: oldpassword.text,
                    newpassword: conformpassword.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
