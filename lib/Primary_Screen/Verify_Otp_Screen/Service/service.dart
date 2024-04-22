import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Primary_Screen/Otp_Success_Screen/body.dart';
import 'package:pass/Primary_Screen/Reset_Password_Screen/body.dart';



class VerifyOTP {
  optpostRegister({required String number,
    required String otpnumber,
    required BuildContext context}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept-Type': 'application/json'
    };
    showLoading();

      final msg = json.encode({
        "mobile_number": number,
        "otp": otpnumber
      },);
      final response = await http.post(
        Uri.parse(ApiUrl.verifyotp), // Replace with your API endpoint
        headers: headers,
        body: msg,
      );
      if (response.statusCode == 200) {
        hideLoading();

        // Login successful
        print('Login successful');
        showSnackBar('Your One-Time Password (OTP) is accurate. \n Thank You', Colors.green);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          OtpSuccess()
              // ResetPassword( mobilenumber: number, opt:otpnumber,)
          ),
        );
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


  optpostForgotPws({required String number,
    required String otpnumber,
    required BuildContext context}) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept-Type': 'application/json'
    };
    showLoading();

    final msg = json.encode({
      "mobile_number": number,
      "otp": otpnumber
    },);
    final response = await http.post(
      Uri.parse(ApiUrl.verifyotp), // Replace with your API endpoint
      headers: headers,
      body: msg,
    );
    if (response.statusCode == 200) {
      hideLoading();

      // Login successful
      print('Login successful');
      showSnackBar('Your One-Time Password (OTP) is accurate. \n Thank You', Colors.green);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            // OtpSuccess()
          ResetPassword( mobilenumber: number, otp: otpnumber,)
        ),
      );
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

//
//       if (response.statusCode == 200) {
//         hideLoading();
//         // return Get.to(() => PasswordResetOtpScreen(email: email));
//       }
//       return _processResponse(response, context);
//     } on Exception {
//       hideLoading();
//     }
//   }
//
//   dynamic _processResponse(http.Response response, BuildContext context) {
//     hideLoading();
//     switch (response.statusCode) {
//       case 400:
//         hideLoading();
//         return showDialog(
//             context: context,
//             builder: (context) {
//               return DialogHelper(
//                 isinternet: false,
//                 title: "Failed",
//                 content: "User doesn't exist!",
//                 positiveBtnText: "Try Again",
//                 negativeBtnText: "",
//                 positiveBtnPressed: () {
//                   // Do something here
//                   Get.back();
//                 },
//               );
//             });
//
//       case 403:
//         hideLoading();
//         return showDialog(
//             context: context,
//             builder: (context) {
//               return DialogHelper(
//                 isinternet: false,
//                 title: "Failed",
//                 content: "Unauthorized Access.",
//                 positiveBtnText: "Ok",
//                 negativeBtnText: "",
//                 positiveBtnPressed: () {
//                   // Do something here
//                   Get.back();
//                 },
//               );
//             });
//
//       case 500:
//         hideLoading();
//         return showDialog(
//             context: context,
//             builder: (context) {
//               return DialogHelper(
//                 isinternet: false,
//                 title: "Failed",
//                 content: "Internal Server Failure.",
//                 positiveBtnText: "Try Again",
//                 negativeBtnText: "",
//                 positiveBtnPressed: () {
//                   // Do something here
//                   Get.back();
//                 },
//               );
//             });
//
//       default:
//         hideLoading();
//         return showDialog(
//             context: context,
//             builder: (context) {
//               return DialogHelper(
//                 isinternet: false,
//                 title: "Failed",
//                 content: "Server Failure. Error Code ${response.statusCode}",
//                 positiveBtnText: "Try Again",
//                 negativeBtnText: "",
//                 positiveBtnPressed: () {
//                   // Do something here
//                   Get.back();
//                 },
//               );
//             });
//     }
//   }
// }
