
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Constant/api_routes.dart';

import '../Controller/visitor_list_Controller.dart';

final VisitorListController visitorController = Get.find();
final String userId = visitorController.visitorId.value;
final String apiUrl = ApiUrl.baseurl;

Future<List<Visitor>> fetchVisitorList() async {
  final String url = "$apiUrl/visitor";
  final response = await http.get(Uri.parse(url));
  print("Response:");
  print(response.body);

  if (response.statusCode == 200) {
    try {
      List<dynamic> dataList = jsonDecode(response.body);
      List<Visitor> visitors = dataList.map((data) => Visitor.fromJson(data)).toList();
      return visitors;
    } catch (e) {
      print('Error decoding JSON: $e');
      return [];
    }
  } else {
    print('Failed to fetch data. Status code: ${response.statusCode}');
    return [];
  }
}
