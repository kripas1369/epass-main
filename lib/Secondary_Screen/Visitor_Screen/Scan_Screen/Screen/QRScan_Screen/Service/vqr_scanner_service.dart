import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/Service/service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Button_Navigation_Bar/screens/botton_navigation_bar.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Homepage_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Service/visitor_history_server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Service_Login_Details/Controller/controller.dart';
import '../../../../Service_Login_Details/loginDetailsService.dart';

class QrScannerService {
  Future<void> postscanner({
    required BuildContext context,
    required String orgId,
    required String purpose,
    required String address,
    required String fullname,
    required String mobilenumber,
    required String email,
  }) async {
    final UserController userController = Get.find();
    String userId = userController.userId.value;
    showLoading();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token") ?? "";
    String storedFullName = prefs.getString('full_name') ?? '';
    String storedMobileNumber = prefs.getString('mobile_number') ?? '';

    Map<String, dynamic> requestBody = {
      "organization": orgId,
      "full_name":fullname,
      "address": address,
      "mobile_number": mobilenumber,
      "email":email,
      "purpose": purpose,
      "visiting_from":"ktm"
    };
    final response = await http.post(
      Uri.parse(ApiUrl.scanQrcode),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken", // Include the access token in headers
      },
      body: json.encode(requestBody),
    );
    if (response.statusCode == 201) {
      showSnackBar(jsonEncode(jsonDecode(response.body)), Colors.green);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ButtonNavigationBar()),
      );
      hideLoading();
      showSnackBar('Successful Added the details', Colors.green);
    } else {
      hideLoading();
      // Convert the decoded JSON to a string before passing it to showSnackBar
      showSnackBar(jsonEncode(jsonDecode(response.body)), Colors.red);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScanScreen()),
      );
    }
  }
}
