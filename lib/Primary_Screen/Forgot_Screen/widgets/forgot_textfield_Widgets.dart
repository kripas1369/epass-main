import 'package:flutter/material.dart';
import 'package:pass/Primary_Screen/Forgot_Screen/Service/service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/textfield.dart';

class ForgotTextfileWidget extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobilenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text("Username (Mobile Number or Email)"),
          SmallSizedBox(),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: mobilenumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input your mobile number", "", Icon(Icons.person))),
          TextSizeBox(),
          TextSizeBox(),
          DefaultButton(
            text: "Continue".toUpperCase(),
            press: () async {
              if (_formKey.currentState!.validate()) {
                String mobileNumber = mobilenumberController.text;
                int parsedMobileNumber = int.tryParse(mobileNumber) ?? 0;
                PasswordReset().passwordreset(
                  mobilenumber: parsedMobileNumber.toString(),
                  context: context,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
