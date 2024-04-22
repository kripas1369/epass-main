import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/screen/notification_screen.dart';
import 'package:pass/routes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MyAppBar({required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment(-1.00, 0.04),
            begin: Alignment(1, -0.04),
            colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
          ),
        ),
      ),
      toolbarHeight: 80,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            "Kripas Khatiwada",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          child: Icon(Icons.person),
          radius: 10,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.visitornotificationScreen);
          },
          icon: Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final Color textcolor;
  final bool enableBackNavigation;

  DashAppBar({
    required this.scaffoldKey,
    required this.title,
    required this.textcolor,
    this.enableBackNavigation = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: enableBackNavigation
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(AppImages.backIcon)),
            )
          : Container(),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textcolor,
        ),
      ),
    );
  }
}
