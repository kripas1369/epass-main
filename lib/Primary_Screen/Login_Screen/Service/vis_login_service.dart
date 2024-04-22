import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/global.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/LoginDetailsService.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisLoginService {
  Future<void> loginUser(
      {required int mobilenumber,
      required context,
      required String password}) async {
    showLoading();
    print(mobilenumber);
    print(password);

    Map<String, dynamic> requestBody = {
      "mobile_number": mobilenumber,
      "password": password,
      // "mobile_number":9860486261,
      // "password":"Flutter123"
    };

    final response = await http.post(Uri.parse(ApiUrl.loginurl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody));

    TokenStorage().saveToken(jsonDecode(response.body));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      hideLoading();
      // Login successful
      print('Login successful');
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("access_token", jsonDecode(response.body)["access"]);

      // TokenStorage().saveToken(jsonDecode(response.body));
      // You can perform additional actions here after successful login
      showSnackBar('Login successful', Colors.green);
      var profileData = await getLoginprofile(context);
      if (profileData != null ) {
        Navigator.pushNamed(context, Routes.bottomnavigationScreen);
        // showLoading();
      }
      // var profileData = await getLoginprofile(context);
      // if (profileData != null && profileData.containsKey('is_kyc_verified')) {
      //   // showLoading();
      //   bool isKYC = profileData['is_kyc_verified'];
      //   isKYC
      //       ? Navigator.pushNamedAndRemoveUntil(
      //           context, Routes.bottomnavigationScreen, (route) => false)
      //       : Navigator.pushNamed(context, Routes.visitorScreen);
      // }
      // Get.offAllNamed(Routes.welcomeScreen);
    }


    else if (response.statusCode == 400) {
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
        hideLoading();
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

  Future<void> setupfingerprintlogin(BuildContext context) async {
    try {
      final localAuth = LocalAuthentication();
      final result = await localAuth.authenticate(
          localizedReason: 'Please verify to set Biometric Login',
          options: AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ));

      if (result) {
        print(result);
        final sharedPreferences = await SharedPreferences.getInstance();
        final _email = sharedPreferences.getString('mobile_number')!;
        final _password = sharedPreferences.getString('password')!;

        sharedPreferences.setString('mobile_number', _email);
        sharedPreferences.setString('password', _password);
        sharedPreferences.setBool('biometricEnable', true);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Successfull',
          desc: 'Successfully Enabled Biometric Login',
          // btnCancelOnPress: () {},
          btnOkColor: primaryColor,
          btnOkOnPress: () {
            // Get.offNamedUntil('/setting', (route) => false);
          },
        ).show();
      }
    } catch (e) {
      print(e);
      showSnackBar('An error occurred. Please try again later.', Colors.red);
    }
  }

  Future<void> visitorloginWithBiometrics(BuildContext context) async {
    try {
      final localAuth = LocalAuthentication();
      final result = await localAuth.authenticate(
          localizedReason: 'Verify to Login',
          options: const AuthenticationOptions(biometricOnly: true));
      if (result) {
        final _sharedPreferences = await SharedPreferences.getInstance();
        final _email = _sharedPreferences.getString('mobile_number')!;
        final _password = _sharedPreferences.getString('password')!;
        loginUser(
            context: context,
            mobilenumber: int.parse(_email),
            password: _password);
      }
    } catch (e) {
      print(e);
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
