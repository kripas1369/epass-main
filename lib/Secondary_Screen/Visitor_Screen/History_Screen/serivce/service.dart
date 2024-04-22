import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  Future<Map<String, dynamic>> fetchData() async {
    final UserController userController = Get.find();
    String userId = userController.userId.value;
    final url = Uri.parse('${ApiUrl.baseurl}/visitor/${userId}/history');

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token") ?? "";
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        print(response.body);
        print("%%%%%%%%%%%%%%%%");
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to fetch data');
    }
  }
}
