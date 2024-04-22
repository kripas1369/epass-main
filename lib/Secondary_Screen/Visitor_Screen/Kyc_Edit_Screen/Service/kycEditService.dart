import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Exception/ExceptionShowing/dialogue_helper.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'package:pass/routes.dart';

import '../../../../Primary_Screen/Forgot_Screen/Service/service.dart';
import '../Kyc_EditForm_Screen/Models/kyc_Edit_from_model.dart';

Future<dynamic> uploadEditKycForm({
   KycEditFromModel? kycEditFromModel,
  required BuildContext context,

}) async {
  DialogHelper.showLoading();
  UserController userController = Get.find();
  String userId = userController.userId.value;
  Map<String, dynamic> requestBody = {
    'name': kycEditFromModel?.name,
    'user': userId,
    'father_name': kycEditFromModel?.fatherName,
    'mother_name': kycEditFromModel?.motherName,
    'grandfather_name': kycEditFromModel?.grandfatherName,
    'marital_status': kycEditFromModel?.maritalStatus,
    'gender': kycEditFromModel?.gender,
    'nationality': kycEditFromModel?.nationality,
    'identity_type': kycEditFromModel?.identityType,
    'identity_number': kycEditFromModel?.identityNumber,
    'secondary_mobile_number': kycEditFromModel?.secondaryMobileNumber,
    'email_address': kycEditFromModel?.emailAddress,
    'whatsapp_viber_number': kycEditFromModel?.whatsappViberNumber,
    "permanent_address_country": kycEditFromModel?.currentAddressCountry,
    "permanent_address_state": kycEditFromModel?.currentAddressState,
    "permanent_address_district": kycEditFromModel?.currentAddressDistrict,
    "permanent_address_municipality": kycEditFromModel?.currentAddressMunicipality,
    'permanent_address_city_village_area': kycEditFromModel
        ?.permanentAddressCityVillageArea,
    'permanent_address_ward_no': kycEditFromModel?.currentAddressWardNo,
    'current_address_country': kycEditFromModel?.currentAddressCountry,
    'current_address_state': kycEditFromModel?.currentAddressState,
    'current_address_district': kycEditFromModel?.currentAddressDistrict,
    'current_address_municipality': kycEditFromModel?.currentAddressMunicipality,
    'current_address_city_village_area': kycEditFromModel
        ?.currentAddressCityVillageArea,
    'current_address_ward_no': kycEditFromModel?.currentAddressWardNo,
    'occupation': kycEditFromModel?.occupation,
    'highest_education': kycEditFromModel?.highestEducation,
    'hobbies': kycEditFromModel?.hobbies,
    'expertise': kycEditFromModel?.expertise,
    'blood_group': kycEditFromModel?.bloodGroup,
  };



  final apiUrl = ApiUrl.baseurl;

  final response = await http.put(

      Uri.parse("$apiUrl/visitor/$userId/kyc"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody)
  );
  print("%%%%%%%%%%%%");
  print("%%%%%%%%%%%%");
  print("%%%%%%%%%%%%");
  print(response.statusCode);
  if (response.statusCode == 200) {
    // Successful response
    hideLoading();
    print('KYC has been verified');
    print(response.body);
    showSnackBar('KYC has been verified', Colors.green);
    Get.offAllNamed(Routes.bottomnavigationScreen);
  } else if (response.statusCode == 400){
    hideLoading();
    showSnackBar('KYC has been not verified', Colors.red);
  } else {
    hideLoading();
    // Other error
    print('An error occurred. Please try again later.');
    showSnackBar('An error occurred. Please try again later.', Colors.red);
  }
}
