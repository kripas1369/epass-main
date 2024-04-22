import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branch_Detail_Screen/screens/branch_detail_screen.dart';

import '../Widgets/appbar.dart';

class OrgBranchDetailsScreen extends StatelessWidget {
  OrgBranchDetailsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(scaffoldKey: _scaffoldKey, title: 'AppBar',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BranchDetailScreenBody(),
        ),
      ),
    );
  }
}
