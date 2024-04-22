import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Service/scan_org_Service.dart';

class OrgIdController extends GetxController {
  RxString orgId = ''.obs;

  void setOrgId(String value) {
    orgId.value = value;// Trigger the API call when orgId is set
    fetchOrgData(orgId:value);
  }
}
