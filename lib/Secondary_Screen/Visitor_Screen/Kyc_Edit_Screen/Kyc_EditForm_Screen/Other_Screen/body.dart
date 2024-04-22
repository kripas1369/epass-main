import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Edit_Screen/Kyc_EditForm_Screen/Other_Screen/textfield.dart';

import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Other_Screen/textfield.dart';

import '../../../Widgets/appbar.dart';
import '../Models/kyc_Edit_from_model.dart';


class EditOtherScreen extends StatelessWidget {
  final KycEditFromModel kycFromModel;
  EditOtherScreen({Key? key, required this.kycFromModel}) : super(key: key);


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: EditOtherTextfiled(kycFromModel: kycFromModel,),
        ),
      ),
    );
  }
}
