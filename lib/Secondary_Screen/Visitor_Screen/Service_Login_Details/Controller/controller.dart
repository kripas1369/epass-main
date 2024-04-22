import 'package:get/get.dart';

class UserController extends GetxController {
  var userId = ''.obs;
   var orgId="".obs;
  void setUserId(String id) {
    userId.value = id;
  }
   void setOrgId(String id) {
    orgId.value = id;
  }
}
