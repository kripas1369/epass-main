import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Exception/ExceptionShowing/dialogue_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileService {
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      DialogHelper.showLoading();
      String apiUrl = ApiUrl.baseurl;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token") ?? "";
      final response = await http.get(
        Uri.parse("$apiUrl/user/me/"),
        headers: {
          "Authorization": "Bearer $accessToken",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);
        hideLoading();
        return userData;
      } else {
        hideLoading();
        print('Failed to fetch user profile');
        print('Status Code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      hideLoading();
      print('Error: $error');
      return null;
    }
  }
}