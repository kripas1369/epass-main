import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'package:pass/routes.dart';

import '../../../Primary_Screen/Forgot_Screen/Service/service.dart';




Future<Map<String, dynamic>?> getLoginprofile(BuildContext context) async {
  Map<String, dynamic> tokenMap = await TokenStorage().getToken();

  if (!tokenMap.containsKey('access')) {
    print('Token not available or invalid');
    return null;
  }

  String token = tokenMap['access'];
  http.Response res = await http.get(
    Uri.parse(ApiUrl.loginDetails),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
  );

  if (res.statusCode == 200) {
    try {
      var data = jsonDecode(res.body);
      if (data.containsKey('id')) {
        String userId = data['id'].toString();
        final UserController userController = Get.find();
        userController.setUserId(userId);
      }

      if (data.containsKey("is_kyc_verified")) {
        bool isKYC = data['is_kyc_verified'];
        data['is_kyc_verified'] = isKYC; // Optionally update the key name
      }

      return data;
    } catch (e) {
      print('Error decoding JSON: $e');
      return null;
    }
  } else if (res.statusCode == 401) {
    if (context.mounted) {
      showSnackBar("Unauthorized access.", Colors.red);
    }
    return null;
  } else {
    print('HTTP Request Error: ${res.statusCode}');
    print('Response Body: ${res.body}');
    return null;
  }
}

Future getOrgLoginprofile(String token) async {
  http.Response res = await http.get(
    Uri.parse(ApiUrl.loginDetails),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  print(res.body);
  if (res.statusCode == 200) {
    try {
      var data = jsonDecode(res.body);
      if (data.containsKey('id')) {
        String userId = data['id'].toString();
        final UserController userController = Get.find();
        userController.setOrgId(userId); // Set the user ID in the controller
      }
      // Print the response body
      print("Response Body: ${res.body}");

      return data; // Return the parsed response data
    } catch (e) {
      // Handle JSON decoding errors
      print('Error decoding JSON: $e');
      return null;
    }
  } else if (res.statusCode == 401) {
    print('HTTP Request Error: ${res.statusCode}');
    return null;
  } else {
    // Handle other HTTP response codes and errors
    print('HTTP Request Error: ${res.statusCode}');
    print('Response Body: ${res.body}');
    return null;
  }
}
