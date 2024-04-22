import 'package:flutter/material.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/Widgets/changepws_widgets.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';


class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSizeBox(width: 0,),
          CustomHeading(text: 'RESET PASSWORD'),
          CustomSubHeading(text: 'Please enter and confirm new password to change.'),
          TextSizeBox(),

          ///TEXTFIELD WIDGET START
          ChangePasswordTextfield(),
          TextSizeBox(),
          TextSizeBox(),
          ///TEXTFIELD WIDGET END


        ],),
    );
  }
}
