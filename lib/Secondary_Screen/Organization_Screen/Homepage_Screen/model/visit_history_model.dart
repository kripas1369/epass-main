// To parse this JSON data, do
//
//     final visitHistoryModel = visitHistoryModelFromMap(jsonString);

import 'dart:convert';

List<VisitHistoryModel> visitHistoryModelFromMap(String str) =>
    List<VisitHistoryModel>.from(
        json.decode(str).map((x) => VisitHistoryModel.fromMap(x)));

String visitHistoryModelToMap(List<VisitHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VisitHistoryModel {
  int id;
  int organization;
  int visitor;
  String fullName;
  String mobileNumber;
  String purpose;
  bool haveVehicle;
  String vehicleNumber;
  bool isWithTeam;
  int numberOfTeam;
  String visitingFrom;
  bool isApproved;
  DateTime departedAt;
  DateTime visitedAt;

  VisitHistoryModel({
    required this.id,
    required this.organization,
    required this.visitor,
    required this.fullName,
    required this.mobileNumber,
    required this.purpose,
    required this.haveVehicle,
    required this.vehicleNumber,
    required this.isWithTeam,
    required this.numberOfTeam,
    required this.visitingFrom,
    required this.isApproved,
    required this.departedAt,
    required this.visitedAt,
  });

  factory VisitHistoryModel.fromMap(Map<String, dynamic> json) =>
      VisitHistoryModel(
        id: json["id"],
        organization: json["organization"],
        visitor: json["visitor"],
        fullName: json["full_name"],
        mobileNumber: json["mobile_number"],
        purpose: json["purpose"],
        haveVehicle: json["have_vehicle"],
        vehicleNumber: json["vehicle_number"],
        isWithTeam: json["is_with_team"],
        numberOfTeam: json["number_of_team"],
        visitingFrom: json["visiting_from"],
        isApproved: json["is_approved"],
        departedAt: DateTime.parse(json["departed_at"]),
        visitedAt: DateTime.parse(json["visited_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "organization": organization,
        "visitor": visitor,
        "full_name": fullName,
        "mobile_number": mobileNumber,
        "purpose": purpose,
        "have_vehicle": haveVehicle,
        "vehicle_number": vehicleNumber,
        "is_with_team": isWithTeam,
        "number_of_team": numberOfTeam,
        "visiting_from": visitingFrom,
        "is_approved": isApproved,
        "departed_at": departedAt.toIso8601String(),
        "visited_at": visitedAt.toIso8601String(),
      };
}
