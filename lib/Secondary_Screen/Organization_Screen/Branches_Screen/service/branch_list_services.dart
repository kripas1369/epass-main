import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Primary_Screen/Forgot_Screen/Service/service.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Secondary_Screen/Organization_Screen/Branches_Screen/model/branches_model.dart';

class BranchListService {
  Future<List<BranchList>> getallbranches() async {
    List<BranchList> branchlists = [];
    try {
      http.Response res =
          await http.get(Uri.parse(ApiUrl.branchlist), headers: {
        "Content-Type": "application/json",
      });
      if (res.statusCode == 200) {
        print(res.body);
        branchlists = branchListFromMap(res.body);
        return branchlists;
      } else {}
    } catch (e) {
      print(e);
      showSnackBar(e.toString(), Colors.red);
    }
    return branchlists;
  }
}
