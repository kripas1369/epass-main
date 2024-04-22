import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Primary_Screen/Login_Screen/service/org_login_service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrgLoginTextfield extends StatefulWidget {
  @override
  State<OrgLoginTextfield> createState() => _OrgLoginTextfieldState();
}

class _OrgLoginTextfieldState extends State<OrgLoginTextfield> {
  final _formKey = GlobalKey<FormState>();

  // final mobilenumber = TextEditingController(text: "9818601603");
  final mobilenumber = TextEditingController(text: "9844131730");

  final password = TextEditingController(text: "test@123##");

  bool obscurePassword = true;
  bool isbuttonClicked = false;
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
          SizedBox(height: 10,),
          TextFormField(
              controller: mobilenumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input your mobile number or email",
                  "", Icon(Icons.person_outlined,color: iconColor,))),
          TextSizeBox(),
          TextSizeBox(),
          TextFieldText(
            text: 'Password',
          ),
          SizedBox(height: 10,),

          TextFormField(
            controller: password,
            obscureText: obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter password";
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: primaryColor,
                      value: true, onChanged: (value) {}),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold

                    ),
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
                      OrgLoginService().loginUser(
                        context: context,
                        mobilenumber: mobilenumber.text,
                        password: password.text,
                      );
                    } else {
                      isbuttonClicked = true;
                      setState(() {});
                    }
                  },
                ),
              ),
              SizedBox(width: 5,),
              InkWell(
                onTap: () async {
                  // Your circular button logic
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  bool? isEnable =
                      sharedPreferences.getBool("orgbiometricEnable");
                  if (isEnable == true) {
                    OrgLoginService().loginWithBiometrics(context);
                  }
                },
               child:Container(
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
                 child: Icon(Icons.fingerprint,size: 40,color: Colors.white,),
               ),
              ),
            ],
          ),
          TextSizeBox(),

          // DefaultButton(text: "LOGIN",
          //   press: () async {
          //     if (_formKey.currentState!.validate()){
          //       OrgLoginService().loginUser(context: context, mobilenumber:mobilenumber.text , password: password.text,);
          //     }
          //   },
          // ),
          // TextSizeBox(),
          //
          // MaterialButton(
          //   height: 60,
          //   minWidth: 400,
          //   color: Colors.blue,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15.0),
          //   ),
          //   onPressed: () async {
          //     if (_formKey.currentState!.validate()){
          //
          //       // LoginService().loginUser(mobilenumber:mobilenumber.text , password: password.text);
          //     }
          //   },
          //   child: Text("LOGIN WITH FINGERPRINT", style: TextStyle(color: Colors.white, fontSize: 20)),
          // ),
        ],
      ),
    );
  }
}
