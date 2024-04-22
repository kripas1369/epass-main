import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Login_Screen/Widgets/org_login_textfield_Widgets.dart';
import 'package:pass/Primary_Screen/Login_Screen/Widgets/visitor_login_textfields_Widgets.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';

import 'package:pass/routes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  bool _showVisitorWidget = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(AppImages.appbarLogo),
          // CustomSizeBox(width: 0,),
          SizedBox(
            height: 80,
          ),
          Image.asset(
            AppImages.appbarLogo,
          ),
          SizedBox(
            height: 40,
          ),
          CustomHeading(text: 'Login'),
          TextSizeBox(),

          CustomSubHeading(
              text:
                  'To login in, input your registered mobile number and password'),
          TextSizeBox(),
          TextSizeBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: primaryColor,
                value: true,
                groupValue: _showVisitorWidget,
                onChanged: (value) {
                  setState(() {
                    _showVisitorWidget = value as bool;
                  });
                },
              ),
              Text("Visitor"),
              Spacer(),
              Radio(
                activeColor: primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: false,
                groupValue: _showVisitorWidget,
                onChanged: (value) {
                  setState(() {
                    _showVisitorWidget = value as bool;
                  });
                },
              ),
              Text("Organization"),
              Spacer(),
            ],
          ),
          _showVisitorWidget ? VisitorLoginTextfield() : OrgLoginTextfield(),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.register);
                },
                child: CustomText(
                  text: "Register",
                ),
              )
            ],
          ),
          TextSizeBox(),
          TextSizeBox(),
        ],
      ),
    );
  }
}
