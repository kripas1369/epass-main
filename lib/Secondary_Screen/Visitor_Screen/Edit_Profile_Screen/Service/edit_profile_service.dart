import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Exception/ExceptionShowing/dialogue_helper.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Primary_Screen/Forgot_Screen/Service/service.dart';

Future<void> uploadEditProfileForm({
  required String nameController,
  required String mobileController,
  required String addressController,
  required String emailController,
}) async {
  try {
    DialogHelper.showLoading();
    UserController userController = Get.find();
    String userId = userController.userId.value;
    Map<String, dynamic> requestBody = {
      'full_name': nameController,
      'mobile_number': mobileController,
      'address': addressController,
      'email': emailController,
    };

    final apiUrl = ApiUrl.baseurl;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("access_token") ?? "";

    final response = await http.patch(
      Uri.parse("$apiUrl/user/edit/"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $accessToken",
      },
      body: json.encode(requestBody),
    );

    print("%%%%%%%%%%%%");
    print(response.statusCode);

    hideLoading();

    if (response.statusCode == 201) {
      // Successful response
      print('Profile has been updated');
      print(response.body);
      showSnackBar('Profile has been updated', Colors.green);
      Get.offAllNamed(Routes.bottomnavigationScreen);
    } else if (response.statusCode == 400) {
      showSnackBar('Failed to update profile', Colors.red);
    } else {
      // Other error
      print('An error occurred. Please try again later.');
      showSnackBar(
          'An error occurred. Please try again later.', Colors.red);
    }
  } catch (error) {
    hideLoading();
    print('Error: $error');
    showSnackBar('An unexpected error occurred.', Colors.red);
  }
}
