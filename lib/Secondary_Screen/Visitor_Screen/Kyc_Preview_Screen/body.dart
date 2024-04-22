import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

import '../Kyc_Edit_Screen/Kyc_EditForm_Screen/Identify_Screen/body.dart';
import 'Model/model.dart';
import '../Kyc_Edit_Screen/kyc_Edit_Screen.dart';
import 'Screen/kyc_Preview_Screen.dart';
import 'Service/kycService.dart';

class KycPreviewScreen extends StatefulWidget {
  @override
  State<KycPreviewScreen> createState() => _KycPreviewScreenState();
}

class _KycPreviewScreenState extends State<KycPreviewScreen> {
  KYCDataModel? kycData;

  KYCService kycService = KYCService();
  // Replace with your correct service class
  @override
  void initState() {
    super.initState();
    kycService.fetchKYCData().then((data) {
      setState(() {
        kycData = data;
      });
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: MyDrawer(),
      floatingActionButton: Container(
        width: 120.0,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditIdentifyScreen(
                        kycData: kycData!,
                      )),
            );
          },
          child: Text(
            "Update KYC",
            style: TextStyle(color: kprimarycolor),
          ),
        ),
      ),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: KYCUpdateForm(),
        ),
      ),
    );
  }
}
