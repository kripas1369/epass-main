import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'screens/visitor_report_screen.dart';

class VisitorReport extends StatelessWidget {
  VisitorReport({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Visitors Report',
        textcolor: Colors.black,
      ),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
