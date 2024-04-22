import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Preview_kyc_Screen/previewScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

import '../Kyc_Form_Screen/Models/kyc_from_model.dart';

class PreviewScreen extends StatelessWidget {
  final KycFromModel kycFromModel;
  PreviewScreen({Key? key, required this.kycFromModel}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: Image.asset(AppImages.backIcon)),
        title: Text("MY KYC",style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: PreviewBody(
            kycFromModel: kycFromModel,
          ),
        ),
      ),
    );
  }
}
