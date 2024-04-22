import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Edit_Org_Profile/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/body.dart';

class OrgButtonNavigationBar extends StatefulWidget {
  const OrgButtonNavigationBar({super.key});

  @override
  State<OrgButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<OrgButtonNavigationBar> {
  List<Widget> children = [OrgHomeScreen(), MyOrgDrawer(), EditOrgProfile()];
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
      bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          onTap: selectedIndex,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
