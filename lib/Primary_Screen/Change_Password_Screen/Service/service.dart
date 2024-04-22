import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Exception/ExceptionShowing/dialogue_helper.dart';
import 'package:pass/routes.dart';

class ChangePasswordService {
  service({
    required String oldpassword,
    required String newpassword,
  }) async {
    Map<String, dynamic> tokenMap = await TokenStorage().getToken();

    if (!tokenMap.containsKey('access')) {
      // Handle the case where the token is not available or is invalid.
      print('Token not available or invalid');
      return null;
    }

    String token = tokenMap['access'];
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };
    showLoading();

    final msg = json.encode(
      {
        "old_password": oldpassword,
        "new_password": newpassword,
      },
    );
    final response = await http.patch(
      Uri.parse(ApiUrl.changePassword), // Replace with your API endpoint
      headers: headers,
      body: msg,
    );
    print(response.body);
    if (response.statusCode == 200) {
      hideLoading();

      // Login successful
      print('Login successful');
      showSnackBar('Password Change Successfully', Colors.green);

      Get.offAllNamed(Routes.bottomnavigationScreen);
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
