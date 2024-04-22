import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Register_Screen/Widgets/org_textfields_Widgets.dart';
import 'package:pass/Primary_Screen/Register_Screen/Widgets/visitor_textfields_Widgets.dart';
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
  late TabController _tabController;
  bool _showVisitorWidget = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
          ),
          Image.asset(
            AppImages.appbarLogo,
          ),
          SizedBox(
            height: 30,
          ),

          CustomHeading(text: 'Register'),
          TextSizeBox(),
          CustomSubHeading(
              text:
                  'Get started with Epass by filling in all the \n necessary details.'),
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

          ///TEXTFIELD WIDGET START
          _showVisitorWidget ? VisitorTextfieldWidget() : OrgTextfieldWidget(),
          TextSizeBox(),
          TextSizeBox(),

          ///TEXTFIELD WIDGET END
          TextSizeBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.login);
                },
                child: CustomText(
                  text: "Login",
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
