import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrgKycModel {
  String? orgName;
  String? estyear;
  String? registernuber;
  String? grandfatherName;
  String? maritalStatus;
  String? identityType;
  String? identityNumber;
  String? secondaryMobileNumber;
  String? primaryMobileNumber;
  String? emailAddress;
  String? whatsappViberNumber;
  String? website;
  String? permanentAddressCountry;
  String? permanentAddressState;
  String? permanentAddressDistrict;
  String? permanentAddressMunicipality;
  String? permanentAddressCityVillageArea;
  String? permanentAddressWardNo;
  String? occupation;
  String? highestEducation;
  String? hobbies;
  String? expertise;
  String? bloodGroup;
  String? vatnumber;
  String? pannumber;
  String? citizenshipfront;
  String? citizenshipback;
  String? aadharcardfront;
  String? aadharcardback;
  String? passportPanfile;
  String? panfile;
  String? voterfile;
  OrgKycModel({
    this.orgName,
    this.estyear,
    this.registernuber,
    this.grandfatherName,
    this.maritalStatus,
    this.identityType,
    this.identityNumber,
    this.secondaryMobileNumber,
    this.primaryMobileNumber,
    this.emailAddress,
    this.whatsappViberNumber,
    this.website,
    this.permanentAddressCountry,
    this.permanentAddressState,
    this.permanentAddressDistrict,
    this.permanentAddressMunicipality,
    this.permanentAddressCityVillageArea,
    this.permanentAddressWardNo,
    this.occupation,
    this.highestEducation,
    this.hobbies,
    this.expertise,
    this.pannumber,
    this.vatnumber,
    this.bloodGroup,
    this.citizenshipfront,
    this.citizenshipback,
    this.aadharcardfront,
    this.aadharcardback,
    this.passportPanfile,
    this.panfile,
    this.voterfile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orgName': orgName,
      'estyear': estyear,
      'registernuber': registernuber,
      'grandfatherName': grandfatherName,
      'maritalStatus': maritalStatus,
      'identityType': identityType,
      'vatnumber': vatnumber,
      'pannumber': pannumber,
      'identityNumber': identityNumber,
      'secondaryMobileNumber': secondaryMobileNumber,
      'primaryMobileNumber': primaryMobileNumber,
      'emailAddress': emailAddress,
      'whatsappViberNumber': whatsappViberNumber,
      'website': website,
      'permanentAddressCountry': permanentAddressCountry,
      'permanentAddressState': permanentAddressState,
      'permanentAddressDistrict': permanentAddressDistrict,
      'permanentAddressMunicipality': permanentAddressMunicipality,
      'permanentAddressCityVillageArea': permanentAddressCityVillageArea,
      'permanentAddressWardNo': permanentAddressWardNo,
      'occupation': occupation,
      'highestEducation': highestEducation,
      'hobbies': hobbies,
      'expertise': expertise,
      'bloodGroup': bloodGroup,
      'citizenshipfront': citizenshipfront,
      'citizenshipback': citizenshipback,
      'aadharcardfront': aadharcardfront,
      'aadharcardback': aadharcardback,
      'passportPanfile': passportPanfile,
      'panfile': panfile,
      'voterfile': voterfile,
    };
  }

  factory OrgKycModel.fromMap(Map<String, dynamic> map) {
    return OrgKycModel(
      orgName: map['orgName'] != null ? map['orgName'] as String : null,
      estyear: map['estyear'] != null ? map['estyear'] as String : null,
      registernuber:
          map['registernuber'] != null ? map['registernuber'] as String : null,
      grandfatherName: map['grandfatherName'] != null
          ? map['grandfatherName'] as String
          : null,
      maritalStatus:
          map['maritalStatus'] != null ? map['maritalStatus'] as String : null,
      identityType:
          map['identityType'] != null ? map['identityType'] as String : null,
      identityNumber: map['identityNumber'] != null
          ? map['identityNumber'] as String
          : null,
      pannumber: map['pannumber'] != null ? map['pannumber'] as String : null,
      vatnumber: map['vatnumber'] != null ? map['vatnumber'] as String : null,
      secondaryMobileNumber: map['secondaryMobileNumber'] != null
          ? map['secondaryMobileNumber'] as String
          : null,
      primaryMobileNumber: map['primaryMobileNumber'] != null
          ? map['primaryMobileNumber'] as String
          : null,
      emailAddress:
          map['emailAddress'] != null ? map['emailAddress'] as String : null,
      whatsappViberNumber: map['whatsappViberNumber'] != null
          ? map['whatsappViberNumber'] as String
          : null,
      website: map['website'] != null ? map['website'] as String : null,
      permanentAddressCountry: map['permanentAddressCountry'] != null
          ? map['permanentAddressCountry'] as String
          : null,
      permanentAddressState: map['permanentAddressState'] != null
          ? map['permanentAddressState'] as String
          : null,
      permanentAddressDistrict: map['permanentAddressDistrict'] != null
          ? map['permanentAddressDistrict'] as String
          : null,
      permanentAddressMunicipality: map['permanentAddressMunicipality'] != null
          ? map['permanentAddressMunicipality'] as String
          : null,
      permanentAddressCityVillageArea:
          map['permanentAddressCityVillageArea'] != null
              ? map['permanentAddressCityVillageArea'] as String
              : null,
      permanentAddressWardNo: map['permanentAddressWardNo'] != null
          ? map['permanentAddressWardNo'] as String
          : null,
      occupation:
          map['occupation'] != null ? map['occupation'] as String : null,
      highestEducation: map['highestEducation'] != null
          ? map['highestEducation'] as String
          : null,
      hobbies: map['hobbies'] != null ? map['hobbies'] as String : null,
      expertise: map['expertise'] != null ? map['expertise'] as String : null,
      bloodGroup:
          map['bloodGroup'] != null ? map['bloodGroup'] as String : null,
      citizenshipfront: map['citizenshipfront'] != null
          ? map['citizenshipfront'] as String
          : null,
      citizenshipback: map['citizenshipback'] != null
          ? map['citizenshipback'] as String
          : null,
      aadharcardfront: map['aadharcardfront'] != null
          ? map['aadharcardfront'] as String
          : null,
      aadharcardback: map['aadharcardback'] != null
          ? map['aadharcardback'] as String
          : null,
      passportPanfile: map['passportPanfile'] != null
          ? map['passportPanfile'] as String
          : null,
      panfile: map['panfile'] != null ? map['panfile'] as String : null,
      voterfile: map['voterfile'] != null ? map['voterfile'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrgKycModel.fromJson(String source) =>
      OrgKycModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
