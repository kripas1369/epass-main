import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/textfield.dart';

import '../../../Widgets/appbar.dart';

class IdentifyScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: "KYC",
        textcolor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
          child: IdentityTextfiled(),
        ),
      ),
    );
  }
}
