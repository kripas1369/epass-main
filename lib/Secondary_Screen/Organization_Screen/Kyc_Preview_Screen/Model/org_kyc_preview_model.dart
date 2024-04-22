// To parse this JSON data, do
//
//     final orgKycPreviewModel = orgKycPreviewModelFromMap(jsonString);

import 'dart:convert';

OrgKycPreviewModel orgKycPreviewModelFromMap(String str) =>
    OrgKycPreviewModel.fromMap(json.decode(str));

String orgKycPreviewModelToMap(OrgKycPreviewModel data) =>
    json.encode(data.toMap());

class OrgKycPreviewModel {
  int id;
  int establishmentYear;
  String vatNumber;
  String panNumber;
  String registrationNumber;
  String country;
  String state;
  String district;
  String municipality;
  String cityVillageArea;
  String wardNo;
  String organizationSummary;
  String whatsappViberNumber;
  String secondaryNumber;
  String telephoneNumber;
  String website;
  dynamic logo;
  int organization;

  OrgKycPreviewModel({
    required this.id,
    required this.establishmentYear,
    required this.vatNumber,
    required this.panNumber,
    required this.registrationNumber,
    required this.country,
    required this.state,
    required this.district,
    required this.municipality,
    required this.cityVillageArea,
    required this.wardNo,
    required this.organizationSummary,
    required this.whatsappViberNumber,
    required this.secondaryNumber,
    required this.telephoneNumber,
    required this.website,
    required this.logo,
    required this.organization,
  });

  factory OrgKycPreviewModel.fromMap(Map<String, dynamic> json) =>
      OrgKycPreviewModel(
        id: json["id"],
        establishmentYear: json["establishment_year"],
        vatNumber: json["vat_number"],
        panNumber: json["pan_number"],
        registrationNumber: json["registration_number"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        municipality: json["municipality"],
        cityVillageArea: json["city_village_area"],
        wardNo: json["ward_no"],
        organizationSummary: json["organization_summary"],
        whatsappViberNumber: json["whatsapp_viber_number"],
        secondaryNumber: json["secondary_number"],
        telephoneNumber: json["telephone_number"],
        website: json["website"],
        logo: json["logo"],
        organization: json["organization"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "establishment_year": establishmentYear,
        "vat_number": vatNumber,
        "pan_number": panNumber,
        "registration_number": registrationNumber,
        "country": country,
        "state": state,
        "district": district,
        "municipality": municipality,
        "city_village_area": cityVillageArea,
        "ward_no": wardNo,
        "organization_summary": organizationSummary,
        "whatsapp_viber_number": whatsappViberNumber,
        "secondary_number": secondaryNumber,
        "telephone_number": telephoneNumber,
        "website": website,
        "logo": logo,
        "organization": organization,
      };
}
