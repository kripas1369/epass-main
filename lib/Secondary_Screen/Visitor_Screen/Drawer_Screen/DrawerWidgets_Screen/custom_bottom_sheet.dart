import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Widgets/button.dart';

void custombottomsheet(BuildContext context, TextEditingController newpassword,
    bool obscureNewPassword, InputDecoration customSuffixandPrefixDecoration) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        // height: Get.height * 0.4,
        color: Colors.white,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Your Password",
                style: TextStyle(
                  fontSize: 24,
                  color: headTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Please enter your password to set up fingerprint login.',
                  style: TextStyle(
                    fontSize: 14,
                    color: subHeadTextColor,
                  )),
              SizedBox(
                height: 20,
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
                decoration: customSuffixandPrefixDecoration,
              ),
              SizedBox(
                height: 40,
              ),
              DefaultButton(
                text: "Continue",
                press: () {},
              )
            ],
          ),
        ),
      );
    },
  );
}
