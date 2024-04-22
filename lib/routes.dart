import 'package:flutter/material.dart';
import 'package:pass/Primary_Screen/Forgot_Screen/body.dart';
import 'package:pass/Primary_Screen/Login_Screen/body.dart';

import 'package:pass/Primary_Screen/Otp_Success_Screen/body.dart';
import 'package:pass/Primary_Screen/Register_Screen/body.dart';
import 'package:pass/Primary_Screen/Splash_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/BottomNavigationBar/org_bottom_navigation_bar.dart';

import 'package:pass/Secondary_Screen/Organization_Screen/Branch_Detail_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Other_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Settings_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Waiting_Visitor_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/screens/history_detail_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Homepage_Screen/body.dart';

import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Other_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Preview_kyc_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/welcome_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/qrScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Setting_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Button_Navigation_Bar/screens/botton_navigation_bar.dart';

import 'Secondary_Screen/Organization_Screen/Kyc_Screen/Preview_kyc_Screen/body.dart';
import 'Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/body.dart';

class Routes {
  ///Primary Screen Routes
  static const String splash = '/splash_screen';
  static const String register = '/register_screen';
  static const String login = '/login_screen';
  static const String forgotpsw = '/forgetpassword_screen';
  static const String verifiy = '/verify';
  static const String otpsuccess = '/success';
  static const String visitorScreen = '/visitor';
  static const String identityScreen = '/identity';
  static const String contactScreen = '/contact';
  static const String addressScreen = '/address';
  static const String otherScreen = '/other';
  static const String welcomeScreen = '/welcome';
  static const String previewScreen = '/previewScreen';
  static const String visitornotificationScreen = '/visitornotificationScreen';

  ///Primary Screen Routes End
  /// Visitor Screen Routes Start
  static const String homepageScreen = '/homepage';
  static const String bottomnavigationScreen = "/bottom-nav";
  static const String scanScreen = '/scanscreen';
  static const String qrScreen = '/qrscreen';
  static const String settingScreen = '/settingscreen';

  /// Visitor Screen Routes End
  ///
  /// Organization Screen Routes Start

  static const String orgScreen = '/orgScreen';
  static const String orgLoginScreen = '/orgScreen';
  static const String orgidentityScreen = '/identity';
  static const String orgcontactScreen = '/orgContaceScreen';
  static const String orgotherScreen = '/orgotherScreen';
  static const String orgpreviewScreen = '/orgpreviewScreen';
  static const String orghomepageScreen = '/orghomepage';
  static const String orgwaitingvisitorsScreen = '/orgwaitingvisitorsScreen';
  static const String orgsettingScreen = "/orgsettingpage";
  static const String orgbranchdetailsScreen = "/orgbranchdetailspage";
  static const String orgnotificationScreen = "/orgnotificationpage";
  static const String kycpreviewScreen = "/kycpreviewScreen";
  static const String orgbottomnavigationScreen = "/org-bottom-nav";
  static const String manualScreen = "/manualScreen";

  /// Organization Screen Routes END

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      ///Primary Screen Routes

      splash: (context) => SplashScreen(),
      register: (context) => RegisterScreen(),
      login: (context) => LoginScreen(),
      forgotpsw: (context) => ForgotPasswordScreen(),
      otpsuccess: (context) => OtpSuccess(),
      visitorScreen: (context) => VisitorScreen(),
      identityScreen: (context) => IdentifyScreen(),
      bottomnavigationScreen: (context) => ButtonNavigationBar(),
      orgbottomnavigationScreen: (context) => OrgButtonNavigationBar(),
      visitornotificationScreen: (context) => VisitorNotificationScreen(),
      // contactScreen:(context)=>ContactScreen(agentFromModel: null,),
      // addressScreen:(contactScreen)=>AddressScreen(),
      // otherScreen:(context)=>OtherScreen(),
      welcomeScreen: (context) => VisitorScreen(),
      // previewScreen:(context)=>PreviewScreen(),
      ///Primary Screen Routes End
      homepageScreen: (context) => HomeScreen(),
      scanScreen: (context) => ScanScreen(),
      // qrScreen:(context)=>QrScanScreen(),
      settingScreen: (context) => SettingScreen(),
      orgScreen: (context) => OrgScreen(),
      orgidentityScreen: (context) => OrgIdentifyScreen(),
      // orgcontactScreen:(context)=>OrgContactScreen(),
      // orgotherScreen:(context)=>OrgOtherScreen(),
      // orgpreviewScreen:(context)=>OrgPreviewScreen(),
      orghomepageScreen: (context) => OrgHomeScreen(),
      orgwaitingvisitorsScreen: (context) => OrgWaitingVisitorScreen(),
      orgsettingScreen: (context) => OrgSettingScreen(),
      orgbranchdetailsScreen: (context) => OrgBranchDetailsScreen(),
      orgnotificationScreen: (context) => OrgNotificationScreen(),
      kycpreviewScreen: (context) => KycPreviewScreen(),
      manualScreen: (context) => ManualScreen(),
    };
  }
}
