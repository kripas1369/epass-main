import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class ContactScreen extends StatelessWidget {
  final KycFromModel kycFromModel;
  ContactScreen({Key? key, required this.kycFromModel}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ContactTextField(
            kycFromModel: kycFromModel,
          ),
        ),
      ),
    );
  }
}
