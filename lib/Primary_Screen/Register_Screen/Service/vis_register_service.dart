import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/body.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Forgot_Screen/Service/service.dart';

class VisRegisterService {
  Future<void> registerOrganization({
    required String mobilenumber,
    required String email,
    required String name,
    required String passowrd,
    // required String address,
    required context,
  }) async {
    // showLoading();

    Map<String, dynamic> body = {
      "mobile_number": mobilenumber,
      "full_name": name,
      "password": passowrd.toString(),
      "email": email,
      "is_visitor": true,
    };

    final response = await http.post(Uri.parse(ApiUrl.registerurl),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode == 201) {
      print("**************");
      print("**************");
      print("**************");
      print("**************");
      print(response.body);

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("mobile_number", mobilenumber);
      sharedPreferences.setString("full_name", name);

      hideLoading();
      // Login successful
      print('Login successful');
      print(response.body);

      // You can perform additional actions here after successful login
      showSnackBar('Please Verify Your OTP.', Colors.green);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyOtp(mobilenumber: mobilenumber)),
      );
    } else if (response.statusCode == 400) {
      print(response.body);

      print("**************");
      print("**************");
      print("**************");
      print("**************");
      hideLoading();
      // Bad request
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody.containsKey('email')) {
        print(response.body);

        final List<dynamic> emailErrors = responseBody['email'];
        if (emailErrors.isNotEmpty) {
          final errorMessage = emailErrors.first;
          print('Error: $errorMessage');
          showSnackBar("Error: $errorMessage", Colors.red);
        }
      } else {
        try {
          print(response.body);

          final Map<String, dynamic> responseBody = json.decode(response.body);

          if (responseBody.containsKey('mobile_number')) {
            final List<dynamic> mobileNumberErrors =
                responseBody['mobile_number'];
            if (mobileNumberErrors.isNotEmpty) {
              final errorMessage = mobileNumberErrors.first;
              print('$errorMessage');
              showSnackBar("$errorMessage", Colors.green);
              return;
            }
          }
        } catch (e) {
          print(response.body);

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
