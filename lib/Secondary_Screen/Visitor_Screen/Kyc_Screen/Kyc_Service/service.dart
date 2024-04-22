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

Future<dynamic> uploadKycForm({
  required KycFromModel kycFromModel,
  required BuildContext context,

}) async {
  // DialogHelper.showLoading();
  UserController userController = Get.find();
  String userId = userController.userId.value;
  Map<String, dynamic> requestBody = {
    'name': kycFromModel.name,
    'user': userId,
    'father_name': kycFromModel.fatherName,
    'mother_name': kycFromModel.motherName,
    'grandfather_name': kycFromModel.grandfatherName,
    'marital_status': kycFromModel.maritalStatus,
    'gender': kycFromModel.gender,
    'nationality': kycFromModel.nationality,
    'identity_type': kycFromModel.identityType,
    // 'identity_documents_front': await http.MultipartFile.fromPath('identity_documents_front', kycFromModel.identification_front!.path),
    // 'identity_documents_back': await http.MultipartFile.fromPath('identity_documents_back', kycFromModel.identification_front!.path),
    // 'pp_size_photo': await http.MultipartFile.fromPath('pp_size_photo', kycFromModel.identification_front!.path),
    'identity_number': kycFromModel.identityNumber,
    'secondary_mobile_number': kycFromModel.secondaryMobileNumber,
    'email_address': kycFromModel.emailAddress,
    'whatsapp_viber_number': kycFromModel.whatsappViberNumber,
    "permanent_address_country": kycFromModel.currentAddressCountry,
    "permanent_address_state": kycFromModel.currentAddressState,
    "permanent_address_district": kycFromModel.currentAddressDistrict,
    "permanent_address_municipality": kycFromModel.currentAddressMunicipality,
    'permanent_address_city_village_area': kycFromModel.permanentAddressCityVillageArea,
    'permanent_address_ward_no': kycFromModel.currentAddressWardNo,
    'current_address_country': kycFromModel.currentAddressCountry,
    'current_address_state': kycFromModel.currentAddressState,
    'current_address_district': kycFromModel.currentAddressDistrict,
    'current_address_municipality': kycFromModel.currentAddressMunicipality,
    'current_address_city_village_area': kycFromModel.currentAddressCityVillageArea,
    'current_address_ward_no': kycFromModel.currentAddressWardNo,
    'occupation': kycFromModel.occupation,
    'highest_education': kycFromModel.highestEducation,
    'hobbies': kycFromModel.hobbies,
    'expertise': kycFromModel.expertise,
    'blood_group': kycFromModel.bloodGroup,
  };



  final apiUrl = ApiUrl.baseurl;

  final response = await http.post(
      Uri.parse("$apiUrl/visitor/$userId/verify-kyc/"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(requestBody)

  );

  print("%%%%%%%%%%%%");
  print("%%%%%%%%%%%%");
  print("%%%%%%%%%%%%");
  print(response.body);


  if (response.statusCode == 201) {
    // Successful response
    showLoading();
    print('KYC has been verified');
    print(response.body);
    showSnackBar("KYC has been verified.", Colors.green);
    Get.offAllNamed(Routes.bottomnavigationScreen);
  } else if (response.statusCode == 400){
    showSnackBar('KYC has been not verified \n${requestBody["email"]}', Colors.red);
    Get.offAllNamed(Routes.previewScreen);
    } else {
      // Other error
      print('An error occurred. Please try again later.');
      showSnackBar('An error occurred. Please try again later.', Colors.red);
    }
  }
