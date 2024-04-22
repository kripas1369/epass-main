import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Waiting_Visitor_Screen/screens/waiting_visitor_screen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Widgets/appbar.dart';

class OrgWaitingVisitorScreen extends StatelessWidget {
  OrgWaitingVisitorScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: MyOrgDrawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey,title: 'AppBar'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WaitingVisitorBody(),
        ),
      ),
    );
  }
}
