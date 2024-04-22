import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Controller/controller.dart';
import 'dart:convert';

import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Model/model.dart';

import '../../Service_Login_Details/Controller/controller.dart';
import '../../State/Service/visitor_list.dart';

class KYCService {
  Future<KYCDataModel> fetchKYCData() async {
    final UserController userController = Get.find();
    final KYCController kycController= Get.find();
    String userId = userController.userId.value;
    final String endpoint = "$apiUrl/visitor/$userId/kyc/";

    try {
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        Map<String, dynamic> kycDataMap = json.decode(response.body);
        KYCDataModel kycData = KYCDataModel.fromJson(kycDataMap);
        kycController.setKYCData(kycData);
        print("@@@@@@@");
        print(response.body);
        print("^^^^^^^^^^^");

        // print(kycDataMap[])
        return kycData;
      } else {
        throw Exception('Failed to load KYC data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch KYC data');
    }
  }
}
