import 'package:flutter/material.dart';
import 'package:pass/Constant/image.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  MyAppBar({required this.scaffoldKey ,required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // return AppBar(
    //   title: Image.asset(AppImages.appbarLogo),
    //   actions: [
    //     // Image.asset(AppImages.dashIcon, height: 30),
    //     // SizedBox(width: 10,),
    //     Image.asset(AppImages.notificationIcon, height: 30),
    //     SizedBox(
    //       width: 10,
    //     ),
    //     // InkWell(
    //     //   onTap: () {
    //     //     scaffoldKey.currentState?.openDrawer();
    //     //   },
    //     //   child: Image.asset(AppImages.drawerIcon, height: 20),
    //     // ),
    //     // SizedBox(width: 20,)
    //   ],
    // );
    return AppBar(
      leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Image.asset(AppImages.backIcon)),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}
