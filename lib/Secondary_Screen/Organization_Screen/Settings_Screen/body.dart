import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Settings_Screen/screens/setting_screen.dart';

import '../Widgets/appbar.dart';

class OrgSettingScreen extends StatelessWidget {
   OrgSettingScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         key: _scaffoldKey,
  drawer: MyOrgDrawer(),
      appBar: MyAppBar(scaffoldKey: _scaffoldKey,title: 'AppBar'),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OrgSettingScreenBody(),
      )),
    );
  }
}