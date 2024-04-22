import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/screen/notification_screen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Widgets/appbar.dart';

class OrgNotificationScreen extends StatelessWidget {
  OrgNotificationScreen({super.key});
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
          child: NotificationScreenBody(),
        ),
      ),
    );
  }
}
