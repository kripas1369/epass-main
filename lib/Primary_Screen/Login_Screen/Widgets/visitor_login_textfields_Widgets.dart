import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Exception/validation.dart';
import 'package:pass/Primary_Screen/Login_Screen/Service/vis_login_service.dart';

import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisitorLoginTextfield extends StatefulWidget {
  @override
  State<VisitorLoginTextfield> createState() => _VisitorLoginTextfieldState();
}

class _VisitorLoginTextfieldState extends State<VisitorLoginTextfield> {
  final _formKey = GlobalKey<FormState>();

  final mobilenumber = TextEditingController(text: "9860486269");

  final password = TextEditingController(text: "Flutter@1234");

  bool obscurePassword = true;
  bool isbuttonClicked = false;
  // Add this line to control password visibility

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),
          TextFieldText(text: 'Username (Mobile Number or Email)'),
          SmallSizedBox(),
          TextFormField(
            controller: mobilenumber,
            validator: validateMobile,
            decoration: customPrefixDecoration(
              "Input your mobile number or email",
              "",
              Icon(Icons.person_outlined, color: Colors.grey),
            ),
          ),
          TextSizeBox(),
          SmallSizedBox(),
          TextFieldText(text: 'Password'),
          SmallSizedBox(),
          TextFormField(
            controller: password,
            obscureText: obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "Input your passworsd",
              "",
              Icon(
                Icons.lock_outline_sharp,
                color: Colors.grey,
              ),
              obscurePassword,
              () {
                // Toggle password visibility when the suffix icon is pressed
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
          ),
          TextSizeBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      activeColor: primaryColor,
                      value: true,
                      onChanged: (value) {}),
                  Text(
                    "Remember me",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, (Routes.forgotpsw));
                },
                child: Center(
                    child: CustomText(
                  text: "Forgot Password?",
                )),
              ),
            ],
          ),
          TextSizeBox(),
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: "LOGIN",
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      isbuttonClicked = false;
                      setState(() {});
                      String mobileNumber = mobilenumber.text;
                      int parsedMobileNumber = int.tryParse(mobileNumber) ?? 0;
                      VisLoginService().loginUser(
                        mobilenumber: parsedMobileNumber,
                        password: password.text,
                        context: context,
                      );
                    } else {
                      isbuttonClicked = true;
                      setState(() {});
                    }
                  },
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  bool? isEnable = sharedPreferences.getBool("biometricEnable");
                  if (isEnable == true) {
                    VisLoginService().visitorloginWithBiometrics(context);
                  }
                  // Your circular button logic
                },
                child: Container(
                  width: 64,
                  height: 60,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      end: Alignment(-0.97, 0.25),
                      begin: Alignment(0.97, -0.25),
                      colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.fingerprint,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          TextSizeBox(),
        ],
      ),
    );
  }

  void _togglePasswordVisibility() {
    // Toggle password visibility
    obscurePassword = !obscurePassword;
  }
}
