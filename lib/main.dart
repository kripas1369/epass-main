import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Controller/controller.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/welcome_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/MyQR/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/formOne.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/formSecond.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Controller/visitor_list_Controller.dart';
import 'package:pass/test.dart';
import 'Exception/success_msg_widget.dart';
import 'Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerScreen.dart';
import 'Secondary_Screen/Visitor_Screen/Edit_Profile_Screen/body.dart';
import 'Secondary_Screen/Visitor_Screen/History_Screen/body.dart';
import 'Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'Secondary_Screen/Visitor_Screen/Scan_Screen/body.dart';
import 'Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'Secondary_Screen/Visitor_Screen/Visitor_Report/body.dart';
import 'routes.dart';
import 'Secondary_Screen/Visitor_Screen/History_Screen/screens/history_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    Get.put(VisitorListController());
    Get.put(KYCController());
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: Routes.getRoutes(),
      // home: FormOneScreen(orgId: '12',)
      // home: ScanScreen(),
      // home: VisitorReport(),
      // home: FormSecondScreen(orgId: '12',)
      // home: ScanScreen(),
      // home: VisitHistoryScreen(),
    );
  }
}
