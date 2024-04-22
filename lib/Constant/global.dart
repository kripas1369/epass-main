

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void savetoken(String token)async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  preferences.setString("token", token);
}
Future<String?> gettoken()async{
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  String? token= sharedPreferences.getString("token");
  return token;
}

void showLoading([String? message]) {
  Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
                height: 100,
                alignment: Alignment.centerLeft,
                child: CircularProgressIndicator()
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              message ?? 'Please Wait',
              style: const TextStyle(fontSize: 16),
            )
          ]),
        ),
      ),
      barrierDismissible: false);
}

//hide loading
void hideLoading() {
  if (Get.isDialogOpen!) Get.back();
}