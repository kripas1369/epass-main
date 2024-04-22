import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Preview_Screen/Screens/org_kyc_preview.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Widgets/appbar.dart';

import '../../../Constant/colors.dart';

class OrgKycPreviewScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  OrgKycPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey: _scaffoldKey,title: 'AppBar'),
      floatingActionButton: Container(
        width: 120.0,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {},
          child: Text(
            "Update KYC",
            style: TextStyle(color: kprimarycolor),
          ),
        ),
      ),
      body: OrgKycPreviewBody(),
    );
  }
}
