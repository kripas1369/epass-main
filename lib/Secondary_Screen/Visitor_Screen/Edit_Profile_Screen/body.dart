import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Edit_Profile_Screen/Screens/edit_profile_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class EditProfileScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Text"),),
      // appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: Body(),
    );
  }
}
