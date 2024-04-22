import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/screens/history_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class VisitHistoryScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(
        enableBackNavigation: false,
        scaffoldKey: _scaffoldKey,
        title: 'Visit history',
        textcolor: Colors.black,
      ),
      body: SingleChildScrollView(child: HistoryBody()),
    );
  }
}
