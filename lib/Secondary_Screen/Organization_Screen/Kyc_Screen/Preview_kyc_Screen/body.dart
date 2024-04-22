import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Preview_kyc_Screen/previewScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Preview_kyc_Screen/previewScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class OrgPreviewScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final OrgKycModel orgKycModel;

  OrgPreviewScreen({super.key, required this.orgKycModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: OrgPreviewBody(
            orgKycModel: orgKycModel,
          ),
        ),
      ),
    );
  }
}
