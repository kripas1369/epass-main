import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Primary_Screen/Register_Screen/Widgets/privacy_policy_Widget.dart';
import 'package:pass/Primary_Screen/Register_Screen/service/org_register_service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrgTextfieldWidget extends StatefulWidget {
  @override
  State<OrgTextfieldWidget> createState() => _OrgTextfieldWidgetState();
}

class _OrgTextfieldWidgetState extends State<OrgTextfieldWidget> {
  final _formKey = GlobalKey<FormState>();

  // final fullname = TextEditingController();

  final mobilenumber = TextEditingController();

  // final organizationtype=TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final organizationname = TextEditingController();

  final conformpassword = TextEditingController();
  final address = TextEditingController();

  bool obscurePassword = true;
  String _selectedValue = 'Select your organization type';



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
            text: 'Organization Name',
          ),
          TextFormField(
              controller: organizationname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Organization Name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                "Input your organization full name",
                "",
                  Icon(Icons.business_outlined,color: iconColor,))),

          TextSizeBox(),
          TextSizeBox(),

          TextFieldText(
            text: 'Type of Orginaization',
          ),
          // TextFormField(
          //     controller: organizationtype,
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "Please Enter Type of Orginaization";
          //       }
          //       return null;
          //     },
          //     decoration:customDecoration("Organization Type", "",)),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              hintText: 'Select an option',
              contentPadding: EdgeInsets.all(16), // Adjust the padding as needed
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              prefixIcon: Icon(Icons.business_center_outlined,color: iconColor,), // Add the desired prefix icon here
            ),
            value: _selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue!;
              });
            },
            items: <String>[
              'Select your organization type',
              'private',
              'government',
              'non-government',
              'other',
              // 'public',
              // 'educational',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.black45)),
              );
            }).toList(),
          ),


          TextSizeBox(),
          TextSizeBox(),

          TextFieldText(
            text: 'E-mail (optional)',
          ),
          TextFormField(
              controller: email,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return "Please Enter Email";
              //   }
              //   return null;
              // },
              decoration: customPrefixDecoration(
                "Input your email",
                "",
                  Icon(Icons.email_outlined,color: iconColor,))),

          TextSizeBox(),
          TextSizeBox(),

          TextFieldText(
            text: 'Mobile Number',
          ),
          TextFormField(
              maxLength: 10,
              controller: mobilenumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                "Input your mobile number",
                "",
                  Icon(Icons.phone_android_rounded,color: iconColor,))),
          TextSizeBox(),

          TextFieldText(
            text: 'Address',
          ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Input your address";
                }
                return null;
              },
              controller: address,
              decoration: customPrefixDecoration(
                  "Input your address", "", Icon(Icons.location_on_outlined,color: iconColor,))),

          TextSizeBox(),

          TextFieldText(
            text: 'Password',
          ),
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
              Icon(Icons.lock_outline_sharp,color: iconColor,),
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
          TextSizeBox(),

          TextFieldText(
            text: 'Confirm Password',
          ),
          TextFormField(
            controller: conformpassword,
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
              Icon(Icons.lock_outline_sharp,color: iconColor,),
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
          PrivacyPolicyWidget(),

          DefaultButton(
            press: () async {
              if (_formKey.currentState!.validate()) {
                OrgRegisterService().registerOrganization(
                    mobilenumber: mobilenumber.text,
                    email: email.text,
                    name: organizationname.text,
                    passowrd: password.text,
                    organizationtype: _selectedValue,
                    organizationname: organizationname.text);
              }
            },
            text: "PROCEED",
          ),
        ],
      ),
    );
  }
}
