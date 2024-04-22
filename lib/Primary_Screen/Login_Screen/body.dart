import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';

import 'Screen/LoginScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title:Image.asset(AppImages.appbarLogo,),
        //   centerTitle: true,),
        body: SingleChildScrollView(
          child: Body(),
          // child: Stack(
          //   children: [
          //     Align(
          //       alignment: Alignment.topRight,
          //       child: Image.asset(AppImages.pdotup, fit: BoxFit.cover),
          //     ),
          //     Spacer(),
          //     Body(),
          //   ],
          // )
        ),

        // body: Container(
        //   clipBehavior: Clip.antiAlias,
        //   decoration: BoxDecoration(
        //       color: Colors.white
        //   ),
        //   width: double.infinity,
        //   child: Stack(
        //     children: <Widget>[
        //       Column(
        //         children: <Widget>[
        //           Align(
        //             alignment: Alignment.topRight,
        //             child: Image.asset(AppImages.pdotup, fit: BoxFit.cover),
        //           ),
        //           Spacer(),
        //
        //           Align(
        //             alignment: Alignment.bottomLeft,
        //             child: Image.asset(AppImages.pdotdown, fit: BoxFit.cover),
        //           ),
        //         ],
        //       ),
        //       ListView(
        //         children: [
        //           Body()
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
