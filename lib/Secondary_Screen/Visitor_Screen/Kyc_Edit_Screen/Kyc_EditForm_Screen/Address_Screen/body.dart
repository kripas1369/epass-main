import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Edit_Screen/Kyc_EditForm_Screen/Address_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class EditVisitorAddressScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final KycFromModel kycFromModel;
  EditVisitorAddressScreen({Key? key, required this.kycFromModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:EditVisitorAddressTextField(kycFromModel: kycFromModel,),
        ),
      ),
    );
  }
}
