import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/MyQR/screens/my_qr.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class MyQrScreen extends StatelessWidget {
  final String qrcode;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyQrScreen({super.key, required this.qrcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: "My QR",
        textcolor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Body(
        qrcode: qrcode,
      )),
    );
  }
}
