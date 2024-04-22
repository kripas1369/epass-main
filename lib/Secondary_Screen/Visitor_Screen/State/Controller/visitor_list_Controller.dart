
import 'package:get/get.dart';

class VisitorListController extends GetxController {
  final RxString visitorId = "".obs;



  void setVisitorId(String id) {
    visitorId.value = id;
  }


  String findHighestId(List<Visitor> visitors) {
    if (visitors.isEmpty) {
      return ""; // Return an empty string if the list is empty
    }

    int highestId = int.tryParse(visitors[0].id) ?? 0;
    for (Visitor visitor in visitors) {
      int currentId = int.tryParse(visitor.id) ?? 0;
      if (currentId > highestId) {
        highestId = currentId;
      }
    }
    print("`*******`");

    print(highestId);

    return highestId.toString();
  }
}

class Visitor {
  final String id;

  Visitor(this.id);

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(json['id'].toString());
  }
}