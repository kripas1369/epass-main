class KYCDataModel {
  int? user;
  String? name;
  String? fatherName;
  String? motherName;
  String? grandfatherName;
  String? maritalStatus;
  String? gender;
  String? nationality;
  String? identityType;
  String? identityNumber;
  Null? identityDocumentsFront;
  Null? identityDocumentsBack;
  String? secondaryMobileNumber;
  String? emailAddress;
  String? whatsappViberNumber;
  String? permanentAddressCountry;
  String? permanentAddressState;
  String? permanentAddressDistrict;
  String? permanentAddressMunicipality;
  String? permanentAddressCityVillageArea;
  String? permanentAddressWardNo;
  String? currentAddressCountry;
  String? currentAddressState;
  String? currentAddressDistrict;
  String? currentAddressMunicipality;
  String? currentAddressCityVillageArea;
  String? currentAddressWardNo;
  String? occupation;
  String? highestEducation;
  String? hobbies;
  String? expertise;
  String? blood_group;

  KYCDataModel(
      {this.user,
        this.name,
        this.fatherName,
        this.motherName,
        this.grandfatherName,
        this.maritalStatus,
        this.gender,
        this.blood_group,
        this.nationality,
        this.identityType,
        this.identityNumber,
        this.identityDocumentsFront,
        this.identityDocumentsBack,
        this.secondaryMobileNumber,
        this.emailAddress,
        this.whatsappViberNumber,
        this.permanentAddressCountry,
        this.permanentAddressState,
        this.permanentAddressDistrict,
        this.permanentAddressMunicipality,
        this.permanentAddressCityVillageArea,
        this.permanentAddressWardNo,
        this.currentAddressCountry,
        this.currentAddressState,
        this.currentAddressDistrict,
        this.currentAddressMunicipality,
        this.currentAddressCityVillageArea,
        this.currentAddressWardNo,
        this.occupation,
        this.highestEducation,
        this.hobbies,
        this.expertise});

  KYCDataModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    name = json['name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    grandfatherName = json['grandfather_name'];
    maritalStatus = json['marital_status'];
    blood_group=json['blood_group'];
    gender = json['gender'];
    nationality = json['nationality'];
    identityType = json['identity_type'];
    identityNumber = json['identity_number'];
    identityDocumentsFront = json['identity_documents_front'];
    identityDocumentsBack = json['identity_documents_back'];
    secondaryMobileNumber = json['secondary_mobile_number'];
    emailAddress = json['email_address'];
    whatsappViberNumber = json['whatsapp_viber_number'];
    permanentAddressCountry = json['permanent_address_country'];
    permanentAddressState = json['permanent_address_state'];
    permanentAddressDistrict = json['permanent_address_district'];
    permanentAddressMunicipality = json['permanent_address_municipality'];
    permanentAddressCityVillageArea =
    json['permanent_address_city_village_area'];
    permanentAddressWardNo = json['permanent_address_ward_no'];
    currentAddressCountry = json['current_address_country'];
    currentAddressState = json['current_address_state'];
    currentAddressDistrict = json['current_address_district'];
    currentAddressMunicipality = json['current_address_municipality'];
    currentAddressCityVillageArea = json['current_address_city_village_area'];
    currentAddressWardNo = json['current_address_ward_no'];
    occupation = json['occupation'];
    highestEducation = json['highest_education'];
    hobbies = json['hobbies'];
    expertise = json['expertise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['name'] = this.name;
    data['blood_group']=this.blood_group;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['grandfather_name'] = this.grandfatherName;
    data['marital_status'] = this.maritalStatus;
    data['gender'] = this.gender;
    data['nationality'] = this.nationality;
    data['identity_type'] = this.identityType;
    data['identity_number'] = this.identityNumber;
    data['identity_documents_front'] = this.identityDocumentsFront;
    data['identity_documents_back'] = this.identityDocumentsBack;
    data['secondary_mobile_number'] = this.secondaryMobileNumber;
    data['email_address'] = this.emailAddress;
    data['whatsapp_viber_number'] = this.whatsappViberNumber;
    data['permanent_address_country'] = this.permanentAddressCountry;
    data['permanent_address_state'] = this.permanentAddressState;
    data['permanent_address_district'] = this.permanentAddressDistrict;
    data['permanent_address_municipality'] = this.permanentAddressMunicipality;
    data['permanent_address_city_village_area'] =
        this.permanentAddressCityVillageArea;
    data['permanent_address_ward_no'] = this.permanentAddressWardNo;
    data['current_address_country'] = this.currentAddressCountry;
    data['current_address_state'] = this.currentAddressState;
    data['current_address_district'] = this.currentAddressDistrict;
    data['current_address_municipality'] = this.currentAddressMunicipality;
    data['current_address_city_village_area'] =
        this.currentAddressCityVillageArea;
    data['current_address_ward_no'] = this.currentAddressWardNo;
    data['occupation'] = this.occupation;
    data['highest_education'] = this.highestEducation;
    data['hobbies'] = this.hobbies;
    data['expertise'] = this.expertise;
    return data;
  }
}
