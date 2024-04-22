import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/screen/notification_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

import '../Drawer_Screen/DrawerScreen.dart';

class VisitorNotificationScreen extends StatelessWidget {
  VisitorNotificationScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'notification',
        textcolor: Colors.black,
      ),
      // appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: VisitorNotificationScreenBody(),
        ),
      ),
    );
  }
}
