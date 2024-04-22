import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/Screen/homepage_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Homepage_Screen/Screen/homepage_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class OrgHomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: MyOrgDrawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: OrgHomeBody(),
        ),
      ),
    );
  }
}
