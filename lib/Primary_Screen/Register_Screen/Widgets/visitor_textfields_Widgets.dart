import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Exception/validation.dart';
import 'package:pass/Primary_Screen/Register_Screen/Service/vis_register_service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'privacy_policy_Widget.dart';

class VisitorTextfieldWidget extends StatefulWidget {
  @override
  State<VisitorTextfieldWidget> createState() => _VisitorTextfieldWidgetState();
}

class _VisitorTextfieldWidgetState extends State<VisitorTextfieldWidget> {
  final _formKey = GlobalKey<FormState>();

  // final fullname = TextEditingController(text: "kripas");
  final fullname = TextEditingController();

  final mobilenumber = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();
  final conformpassword = TextEditingController();
  // final address= TextEditingController();

  bool obscurePassword = true;
  @override
  void initState() {
    super.initState();
    // Load stored values on initialization
    loadStoredValues();
  }

  void loadStoredValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullname.text = prefs.getString('fullname') ?? '';
      mobilenumber.text = prefs.getString('mobilenumber') ?? '';
    });
  }

  void saveValuesToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('fullname', fullname.text);
    prefs.setString('mobilenumber', mobilenumber.text);
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
          TextFieldText(
            text: 'Full Name',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: fullname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please fill your full name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input your full name",
                  "",
                  Icon(
                    Icons.person_outlined,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          SmallSizedBox(),
          TextFieldText(
            text: 'Mobile Number',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: mobilenumber,
              // keyboardType: TextInputType.number,
              // maxLength: 10,
              validator: validateMobile,
              decoration: customPrefixDecoration(
                  "Please enter mobile number",
                  "",
                  Icon(
                    Icons.phone_android_rounded,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          SmallSizedBox(),
          TextFieldText(
            text: 'E-mail (optional)',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: email,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input your email",
                  "",
                  Icon(
                    Icons.mail_outline,
                    color: iconColor,
                  ))),
          // TextSizeBox(),

          // TextFieldText(
          //   text: 'Address',
          // ),
          // TextFormField(
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "Input your address";
          //       }
          //       return null;
          //     },
          //     controller: address,
          //     decoration: customPrefixDecoration(
          //         "Input your address", "", Icon(Icons.location_on_outlined,color: iconColor,))),

          TextSizeBox(),
          SmallSizedBox(),

          TextFieldText(
            text: 'Password',
          ),
          SmallSizedBox(),
          TextFormField(
            controller: password,
            obscureText: obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
            decoration: customSuffixandPrefixDecoration(
              "Input your password",
              "",
              Icon(
                Icons.lock_outline_sharp,
                color: iconColor,
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
          //
          // TextFieldText(
          //   text: 'Confirm Password',
          // ),
          // TextFormField(
          //   controller: conformpassword,
          //   obscureText: obscurePassword,
          //   validator: (value) {
          //     if (value == null || value.isEmpty) {
          //       return "Please enter password";
          //     }
          //     return null;
          //   },
          //   decoration: customSuffixandPrefixDecoration(
          //     "Input your password",
          //     "",
          //     Icon(Icons.lock_outline_sharp,color: iconColor,),
          //     obscurePassword,
          //     () {
          //       // Toggle password visibility when the suffix icon is pressed
          //       setState(() {
          //         obscurePassword = !obscurePassword;
          //       });
          //     },
          //   ),
          // ),
          // TextSizeBox(),

          PrivacyPolicyWidget(),
          TextSizeBox(),
          SmallSizedBox(),

          DefaultButton(
            press: () async {
              if (_formKey.currentState!.validate()) {
                VisRegisterService().registerOrganization(
                  // address: address.text,
                  mobilenumber: mobilenumber.text,
                  email: email.text,
                  name: fullname.text,
                  passowrd: password.text,
                  context: context,
                );
              }
            },
            text: "Register".toUpperCase(),
          ),
        ],
      ),
    );
  }
}
