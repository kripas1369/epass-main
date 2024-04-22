import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/Service/service.dart';
import 'package:http/http.dart' as http;

class BranchService {
  Future<void> createBranch() async {
    try {
      showLoading();
      Map<String, dynamic> requestBody = {"branch_name": "hello"};
      Map<String, dynamic> data = await TokenStorage().getToken();

      final response = await http.post(Uri.parse(ApiUrl.createBranchurl),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${data["access"]}"
          },
          body: json.encode(requestBody));
      print(response.statusCode);
      if (response.statusCode == 200) {
        hideLoading();
        print(response.body);
      } else {
        hideLoading();

        print("error");
      }
    } catch (e) {
      hideLoading();
      // Other error
      print('An error occurred. Please try again later.');
      showSnackBar('An error occurred. Please try again later.', Colors.red);
    }
  }
}
