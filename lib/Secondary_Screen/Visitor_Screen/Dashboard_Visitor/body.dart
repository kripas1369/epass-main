import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Screen/dashboard_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: DashboardBody(),
    );
  }
}
