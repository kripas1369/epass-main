import 'dart:convert';

List<BranchList> branchListFromMap(String str) =>
    List<BranchList>.from(json.decode(str).map((x) => BranchList.fromMap(x)));

String branchListToMap(List<BranchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class BranchList {
  int id;
  int organization;
  String name;
  String country;
  String state;
  String district;
  String municipality;
  String cityVillageArea;
  String wardNo;
  String employeeSize;

  BranchList({
    required this.id,
    required this.organization,
    required this.name,
    required this.country,
    required this.state,
    required this.district,
    required this.municipality,
    required this.cityVillageArea,
    required this.wardNo,
    required this.employeeSize,
  });

  factory BranchList.fromMap(Map<String, dynamic> json) => BranchList(
        id: json["id"],
        organization: json["organization"],
        name: json["name"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        municipality: json["municipality"],
        cityVillageArea: json["city_village_area"],
        wardNo: json["ward_no"],
        employeeSize: json["employee_size"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "organization": organization,
        "name": name,
        "country": country,
        "state": state,
        "district": district,
        "municipality": municipality,
        "city_village_area": cityVillageArea,
        "ward_no": wardNo,
        "employee_size": employeeSize,
      };
}
