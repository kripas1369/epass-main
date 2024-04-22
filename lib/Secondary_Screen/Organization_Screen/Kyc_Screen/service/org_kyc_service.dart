import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/global.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'package:pass/routes.dart';

import '../../../../Exception/ExceptionShowing/dialogue_helper.dart';
import '../../../../Primary_Screen/Change_Password_Screen/Service/service.dart';
import 'package:http/http.dart' as http;

class OrgKycService {
  Future<dynamic> uploadKycForm({
    required OrgKycModel kycFromModel,
    required BuildContext context,
  }) async {
    hideLoading();
    DialogHelper.showLoading();
    UserController userController = Get.find();
    String userId = userController.orgId.value;
    print(kycFromModel.website);
    Map<String, dynamic> requestBody = {
      'orgname': kycFromModel.orgName,
      'user': userId,
      // 'father_name': kycFromModel.fatherName,
      // 'mother_name': kycFromModel.motherName,
      'grandfather_name': kycFromModel.grandfatherName,
      // 'marital_status': kycFromModel.maritalStatus,
      // 'gender': kycFromModel.gender,
      'vat_number': kycFromModel.vatnumber,
      'pan_number': kycFromModel.pannumber,
      // 'nationality': kycFromModel.nationality,
      'telephone_number': kycFromModel.primaryMobileNumber,
      'secondary_number': kycFromModel.secondaryMobileNumber,
      'registration_number': kycFromModel.registernuber,
      'country': kycFromModel.permanentAddressCountry,
      'state': kycFromModel.permanentAddressState,
      'district': kycFromModel.permanentAddressDistrict,
      'municipality': kycFromModel.permanentAddressMunicipality,
      'ward_no': kycFromModel.permanentAddressWardNo,
      'website': kycFromModel.website,
      'organization': userId,
      'identity_type': kycFromModel.identityType,
      'organization_summary': 'This is summary',

      'identity_number': kycFromModel.identityNumber,
      'secondary_mobile_number': kycFromModel.secondaryMobileNumber,
      'email_address': kycFromModel.emailAddress,
      'whatsapp_viber_number': kycFromModel.whatsappViberNumber,
      "permanent_address_country": kycFromModel.permanentAddressCountry,
      "permanent_address_state": kycFromModel.permanentAddressState,
      "permanent_address_district": kycFromModel.permanentAddressDistrict,
      "permanent_address_municipality":
          kycFromModel.permanentAddressMunicipality,
      'city_village_area': kycFromModel.permanentAddressCityVillageArea,
      'permanent_address_ward_no': kycFromModel.permanentAddressWardNo,
      'primarynumber': kycFromModel.primaryMobileNumber,
      'estyear': kycFromModel.estyear,
      'occupation': kycFromModel.occupation,
      'highest_education': kycFromModel.highestEducation,
      'hobbies': kycFromModel.hobbies,
      'expertise': kycFromModel.expertise,
      'blood_group': kycFromModel.bloodGroup,
    };

    Map<String, dynamic> tokenMap = await TokenStorage().getToken();

    if (!tokenMap.containsKey('access')) {
      // Handle the case where the token is not available or is invalid.
      print('Token not available or invalid');
      return null;
    }

    String token = tokenMap['access'];
    print('Token: $token');

    final apiUrl = ApiUrl.baseurl;

    final response = await http.post(Uri.parse(ApiUrl.verifykyc),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: json.encode(requestBody));

    print("%%%%%%%%%%%%");
    print("%%%%%%%%%%%%");
    print("%%%%%%%%%%%%");
    print(response.body);

    if (response.statusCode == 201) {
      // Successful response
      hideLoading();
      print('KYC has been verified');
      print(response.body);
      showSnackBar('KYC has been verified', Colors.green);
      Get.offAllNamed(Routes.orghomepageScreen);
    } else if (response.statusCode == 400) {
      hideLoading();
      showSnackBar('KYC has been not verified', Colors.red);
    } else {
      hideLoading();
      // Other error
      print('An error occurred. Please try again later.');
      showSnackBar('An error occurred. Please try again later.', Colors.red);
    }
  }
}
