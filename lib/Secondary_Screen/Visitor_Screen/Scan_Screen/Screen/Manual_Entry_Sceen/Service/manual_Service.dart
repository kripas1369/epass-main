import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Exception/ExceptionShowing/dialogue_helper.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/Service/service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Controller/orgId_QR.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/Model/manual_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Service/visitor_history_server.dart';
import 'package:pass/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Service_Login_Details/Controller/controller.dart';

class QrManualService {
  Future<void> postManual({
    required String orgid,
    required String mobilenumber,
    required String email,
    required String name,
    required String numberofvisitor,
    required String remark,
    required String purpose,
    required String visitingform,
    required String vehiclenumber,
    required String address,
    required String idtype,
    required String idnumber,
    required String havevehicle,
    required context,
  }) async {
    showLoading();
    try {
      final Uri uri = Uri.parse(ApiUrl.scanQrcode);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String authToken = prefs.getString('access_token') ?? '';
      print(authToken);

      // set the request headers
      final Map<String, String> headers = {
        "Content-type": "application/json",
        "Authorization": "Bearer $authToken",
      };

      final Map<String, dynamic> body = {
        "organization": orgid,
        "full_name": name,
        "address":address,
        "mobilenumber": mobilenumber,
        "email": email,
        "number_of_team": numberofvisitor,
        "type_of_id":idtype,
        "id_number":idnumber,
        "have_vehicle":havevehicle,
        "visiting_from": "visitingform",
        "vehicle_number": vehiclenumber,
        "purpose": purpose,
      };

      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      dynamic responseBody = jsonDecode(response.body);

      print(responseBody);

      if (response.statusCode == 201) {
        hideLoading();
        Navigator.pushNamed(context, Routes.bottomnavigationScreen);
        showSnackBar('Successful', Colors.green);
      } else {
        hideLoading();
        if (responseBody is String) {
          print(responseBody);
          showSnackBar(responseBody, Colors.red);
        } else {
          // Handle other cases if needed

          print("Unexpected response format: $responseBody");
          showSnackBar("Unexpected $responseBody", Colors.red);
        }
        Navigator.pushNamed(context, Routes.manualScreen);
      }
    } catch (e) {
      print(e.toString() + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }
  }
}
