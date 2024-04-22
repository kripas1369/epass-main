import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Homepage_Screen/model/visit_history_model.dart';
import 'package:http/http.dart' as http;

import '../../../../Constant/tokenStore.dart';

class HomeService {
  Future<List<VisitHistoryModel>> getallvisisthistory() async {
    List<VisitHistoryModel> visits = [];
    try {
      Map<String, dynamic> data = await TokenStorage().getOrgdata();
      Map<String, dynamic> data1 = await TokenStorage().getToken();

      http.Response res = await http.get(
        Uri.parse(
            "${ApiUrl.baseurl}/organization/${data["id"]}/visit-history/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${data1["access"]}"
        },
      );
      if (res.statusCode == 200) {
        visits = visitHistoryModelFromMap(res.body);
      } else {
        print(res.body);
      }
    } catch (e) {
      print(e.toString());
    }
    return visits;
  }
}
