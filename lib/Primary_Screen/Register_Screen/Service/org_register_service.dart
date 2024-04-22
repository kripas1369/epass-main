import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Forgot_Screen/Service/service.dart';

class OrgRegisterService {
  Future<void> registerOrganization(
      {required String mobilenumber,
      required String email,
      required String name,
      required String passowrd,
      required String organizationtype,
      required String organizationname}) async {
    showLoading();

    Map<String, dynamic> body = {
      "mobile_number": mobilenumber,
      "full_name": name,
      "organization_type": organizationtype,
      "organization_name": organizationname,
      "password": passowrd,
      "email": email,
    };



    final response = await http.post(Uri.parse(ApiUrl.orgregisterurl),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Login successful
      print('Login successful');

      print(response.body);
      TokenStorage().saveToken(jsonDecode(response.body));
      // You can perform additional actions here after successful login
      showSnackBar('Register successful', Colors.green);

      Get.offAllNamed(Routes.orgLoginScreen);
    } else if (response.statusCode == 400) {
      hideLoading();
      // Bad request
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody.containsKey('email')) {
        final List<dynamic> emailErrors = responseBody['email'];
        if (emailErrors.isNotEmpty) {
          final errorMessage = emailErrors.first;
          print('Error: $errorMessage');
          showSnackBar("Error: $errorMessage", Colors.red);
        }
      } else {
        try {
          final Map<String, dynamic> responseBody = json.decode(response.body);

          if (responseBody.containsKey('mobile_number')) {
            final List<dynamic> mobileNumberErrors =
                responseBody['mobile_number'];
            if (mobileNumberErrors.isNotEmpty) {
              final errorMessage = mobileNumberErrors.first;
              print('Error: $errorMessage');
              showSnackBar("Error: $errorMessage", Colors.red);
              return;
            }
          }
        } catch (e) {
          // Handle JSON decoding errors
          print('Error decoding JSON: $e');
        }

        // If the JSON structure doesn't match the expected format or any other error occurs,
        // you can fall back to a generic error message.
        final errorMessage = 'Not a valid choice';
        print('Error: $errorMessage');
        showSnackBar(" $errorMessage", Colors.red);
      }
    } else if (response.statusCode == 401) {
      hideLoading();
      // Unauthorized
      showSnackBar("Unauthorized access.", Colors.red);
    } else {
      hideLoading();
      // Other error
      print(response.body);
      print('An error occurred. Please try again later.');
      showSnackBar('An error occurred. Please try again later.', Colors.red);
    }
  }
}
