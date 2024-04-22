import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/Service/service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/Models/notification_model.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';

class NotificationService {
  Future<List<VisitNotification>> getallnotification() async {
    List<VisitNotification> notification = [];
    try {
      Map<String, dynamic> tokenMap = await TokenStorage().getToken();

      String token = tokenMap['access'];
      final UserController userController = Get.find();
      String userId = userController.userId.value;
      http.Response res = await http.get(
        Uri.parse("${ApiUrl.baseurl}/notification/notificationdata/$userId/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (res.statusCode == 200) {
        notification = visitNotificationFromMap(res.body);
      } else {
        showSnackBar("Something went wrong ${res.body}", Colors.red);
      }
    } catch (e) {
      print(e);
      showSnackBar("Something went wrong", Colors.red);
    }
    return notification;
  }
}
