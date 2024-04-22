import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Preview_Screen/Model/org_kyc_preview_model.dart';
import 'package:http/http.dart' as http;

import '../../../../Constant/tokenStore.dart';

class OrgKycPreviewService {
  Future<OrgKycPreviewModel> getorgkyc() async {
    OrgKycPreviewModel? orgKycPreviewModel;
    try {
      Map<String, dynamic> tokenMap = await TokenStorage().getToken();

      String token = tokenMap['access'];
      http.Response res = await http.get(
        Uri.parse(ApiUrl.getorgkycpreview),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (res.statusCode == 200) {
        orgKycPreviewModel = orgKycPreviewModelFromMap(res.body);
      } else {
        print(res.body);
      }
    } catch (e) {
      print(e);
    }
    return orgKycPreviewModel!;
  }
}
