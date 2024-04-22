import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Model/model.dart';


class KYCController extends GetxController {
  var kycData = KYCDataModel().obs;

  void setKYCData(KYCDataModel data) {
    kycData.value = data;
  }
}
