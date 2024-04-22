import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Edit_Screen/Kyc_EditForm_Screen/Preview_kyc_Screen/previewScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Preview_kyc_Screen/previewScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import '../Models/kyc_Edit_from_model.dart';




class EditPreviewScreen extends StatelessWidget {
  final KycEditFromModel kycFromModel;
  EditPreviewScreen ({Key? key, required this.kycFromModel}) : super(key: key);

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
          child: EditPreviewBody(kycFromModel: kycFromModel,),
        ),
      ),
    );
  }
}
