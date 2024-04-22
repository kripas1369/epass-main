import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class VisitorAddressScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final KycFromModel kycFromModel;
  VisitorAddressScreen({Key? key, required this.kycFromModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // key: _scaffoldKey,
      // appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Image.asset(AppImages.backIcon)),
        title: Text("KYC",style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: VisitorAddressTextField(
            kycFromModel: kycFromModel,
          ),
        ),
      ),
    );
  }
}
