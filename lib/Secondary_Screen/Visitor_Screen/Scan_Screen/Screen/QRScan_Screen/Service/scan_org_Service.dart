
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Controller/orgId_QR.dart';


@override
iniState(){
  // super.in
  fetchOrgData(orgId: "2");
}
void fetchOrgData({required String orgId}) async {
  // OrgIdController orgIdController = OrgIdController();

  String apiUrl = '${ApiUrl.baseurl}/organization/${orgId}';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Successful API call, parse the response
      List<dynamic> data = json.decode(response.body);
      print("this isssss");
      print(data);
    } else {
      // Handle the error
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any exceptions
    print('Exception: $error');
  }
}