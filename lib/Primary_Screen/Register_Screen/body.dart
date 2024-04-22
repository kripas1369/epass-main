import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';

import 'Screen/register_Screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:Image.asset(AppImages.appbarLogo,),
      //   centerTitle: true,),
      body: SingleChildScrollView(
        child: Body(),
        // child: Container(
        //     child: Stack(
        //       children: [
        //         Align(
        //                     alignment: Alignment.topRight,
        //                     child: Image.asset(AppImages.pdotup, fit: BoxFit.cover),
        //                   ),
        //         Spacer(),
        //         Body(),
        //       ],
        //     )
        // )
      ),
    );
  }
}
