import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class OrgContactScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final OrgKycModel kycModel;

   OrgContactScreen({super.key, required this.kycModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: OrgContactTextField(orgKycModel: kycModel),
        ),
      ),
    );
  }
}
