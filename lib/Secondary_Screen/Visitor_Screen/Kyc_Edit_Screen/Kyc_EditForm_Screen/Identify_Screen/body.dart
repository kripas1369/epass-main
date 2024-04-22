import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Edit_Screen/Kyc_EditForm_Screen/Identify_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/textfield.dart';

import '../../../Kyc_Preview_Screen/Model/model.dart';
import '../../../Widgets/appbar.dart';

class EditIdentifyScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final KYCDataModel kycData;

  EditIdentifyScreen({required this.kycData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: EditIdentityTextfiled(
            kycEditData: kycData,
          ),
        ),
      ),
    );
  }
}
