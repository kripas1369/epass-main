import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Edit_Org_Profile/Screens/edit_org_profile.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Widgets/appbar.dart';

class EditOrgProfile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey: _scaffoldKey,title: 'AppBar'),
      body: EditOrgBody(),
    );
  }
}
