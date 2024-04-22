import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Other_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';

import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Other_Screen/textfield.dart';

import '../../../Widgets/appbar.dart';


class OrgOtherScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final OrgKycModel orgKycModel;

   OrgOtherScreen({super.key, required this.orgKycModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey,title: 'AppBar'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: OrgOtherTextfiled(orgKycModel: orgKycModel),
        ),
      ),
    );
  }
}
