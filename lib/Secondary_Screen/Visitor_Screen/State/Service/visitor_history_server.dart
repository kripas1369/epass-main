import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';

final UserController userController = Get.find();
String userId = userController.userId.value;
final apiUrl = ApiUrl.baseurl;


Future<void> fetchHistory() async {
  final url = "$apiUrl/visitor/$userId/history/";

  final response = await http.get(Uri.parse(url));

  print(response.body);


  if (response.statusCode == 200) {
    // Successful response, you can process the data here
    print('Response data: ${response.body}');
  } else {
    // Handle error, e.g., network issue or non-200 HTTP status
    print('Failed to fetch data. Status code: ${response.statusCode}');
  }
}
