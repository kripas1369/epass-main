import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Primary_Screen/Forgot_Screen/widgets/forgot_textfield_Widgets.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Image.asset(AppImages.appbarLogo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.appbarLogo),
              CustomSizeBox(
                width: 0,
              ),
              CustomHeading(text: 'Forgot Password'),
              TextSizeBox(),

              CustomSubHeading(
                  text:
                      'The OTP has been sent to your email and \n mobile number to reset the password.'),
              TextSizeBox(),

              ForgotTextfileWidget()
            ],
          ),
        ),
      ),
    );
  }
}
