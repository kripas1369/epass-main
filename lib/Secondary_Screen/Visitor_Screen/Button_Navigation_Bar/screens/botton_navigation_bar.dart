import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Analytics_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Edit_Profile_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/body.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/formOne.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/body.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  List<Widget> children = [
    DashboardScreen(),
    AnalyticsScreen(),
    ScanScreen(),
    VisitHistoryScreen(),
    MyDrawer(),
  ];
  int index = 0;
  void selectedIndex(int i) {
    index = i;
    if (i == 1) {
      print("hello");
      const Scaffold().createState().openDrawer();
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[index],
      bottomNavigationBar: ConvexAppBar(
        color: iconColor,
        activeColor: primaryColor,
        backgroundColor: Colors.white,
        height: 60,
        cornerRadius: 10,
        style: TabStyle.fixedCircle,
        items: [
          TabItem(
              icon: Icons.home_outlined,
              title: 'Home',
          ),
          TabItem(icon: Icons.crisis_alert_rounded, title: 'Analytics'),
          TabItem(icon:   Container(
            width: 64,
            height: 84,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.00, 0.00),
                end: Alignment(1, 0),
                colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
              ),
              shape: OvalBorder(),
            ),
            child: Icon(Icons.qr_code_scanner_rounded,size: 30,color: Colors.white,),
          ), title: ''),
          TabItem(icon: Icons.history, title: 'History'),
          TabItem(icon: Icons.menu, title: 'Menu'),
        ],
        onTap: selectedIndex,
        initialActiveIndex: index,
      ),
    );
  }
}
