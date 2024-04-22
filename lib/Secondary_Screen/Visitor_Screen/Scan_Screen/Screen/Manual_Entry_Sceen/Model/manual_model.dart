import 'dart:io';

class ManuallyFormModel {
  final String fullname;
  final String address;
  final String mobilenumber;
  final String email;
  final String visiting_from;
  final String vehiclenumber;
  final String numberofVisitor;
  final String identification_number;
  final String organization;
  final String purpose;
  final String havevehicle;
  final String identification_type;
  final String remark;
  int? orgid;

  // final File identification_front;
  // final File identification_back;


  ManuallyFormModel({
    required this.orgid,
    required this.remark,
    required this.numberofVisitor,
    required this.address,
    required this.fullname,
    required this.organization,
    required this.email,
    required this.mobilenumber,
    required this.purpose,
    required this.visiting_from,
    required this.havevehicle,
    required this.vehiclenumber,
    required this.identification_type,
    required this.identification_number,
    // required this.identification_front,
    // required this.identification_back,

  });
}
