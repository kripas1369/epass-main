import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Primary_Screen/Verify_Otp_Screen/body.dart';
import 'package:pass/routes.dart';

class PasswordReset {
  Future<void> passwordreset({required String mobilenumber,
        required BuildContext context}) async {
    showLoading();
    Map<String, dynamic> requestBody = {
      "mobile_number": mobilenumber,
    };

    final response = await http.post(Uri.parse(ApiUrl.forgotPassword),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody)

    );


    if (response.statusCode == 200) {
      hideLoading();

      // Login successful
      print('Successfully send');
      print(response.body);
      TokenStorage().saveToken(jsonDecode(response.body));

      showSnackBar('Please Check Your OTP', Colors.deepOrange);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VerifyOtpForgotPws(mobilenumber: mobilenumber,),
      )
      );
      // Get.offAllNamed(Routes.verifiy);
    } else if (response.statusCode == 400) {
      hideLoading();
      // Bad request
      try {
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          if (responseBody.containsKey('email')) {
            final List<dynamic> emailErrors = responseBody['email'];
            if (emailErrors.isNotEmpty) {
              final errorMessage = emailErrors.first;
              print('Error: $errorMessage');
              showSnackBar("Error: $errorMessage", Colors.red);
              return;
            }
          }
        }

        final decodedResponse = json.decode(response.body);

        if (decodedResponse is List<dynamic> && decodedResponse.isNotEmpty) {
          final errorMessage = decodedResponse.first.toString();
          print('Error: $errorMessage');
          showSnackBar("$errorMessage", Colors.red);
        } else {
          print('Unexpected error format.');
          showSnackBar("Unexpected error format.", Colors.red);
        }
      } catch (e) {
        // Handle JSON decoding errors
        print('Error decoding JSON: $e');
      }
    } else if (response.statusCode == 401) {
      hideLoading();
      // Unauthorized
      showSnackBar("Unauthorized access.", Colors.red);
    } else {
      hideLoading();
      // Other error
      print('An error occurred. Please try again later.');
      showSnackBar('An error occurred. Please try again later.', Colors.red);
    }
  }
}
void showSnackBar(String message, Color color) {
  Get.snackbar(
    message,
    "",
    backgroundColor: color,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
  );
}
