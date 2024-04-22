import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/scan.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

import '../../../Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/scanScreen.dart';

class ScanScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(),
        body: SingleChildScrollView(child: Body()));
  }
}
