import 'package:flutter/cupertino.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         // SizedBox(height: 50,),
         //  CustomHeading(text: 'Welcome!!',),
          SizedBox(height:20,),
          Image.asset(AppImages.successimage),
          SizedBox(height:30,),
          CustomHeading(text: 'Congratulation! \n Welcome to Epass',),
          SizedBox(height: 10,),
          Text("We are happy to have you. It’s time to scan and track\n  the visitor details and manage it.",textAlign: TextAlign.center,),

          SizedBox(height:60,),

        DefaultButton(text: "CONTINUE",press: (){
          Navigator.pushNamed(context, Routes.login);
        },)
        ],

      ),
    );
  }
}
