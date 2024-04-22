import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Preview_kyc_Screen/body.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

import '../model/orgkycmodel.dart';
enum Gender { Male, Female, Others }
class OrgOtherTextfiled extends StatefulWidget {
  const OrgOtherTextfiled({Key? key, required this.orgKycModel}) : super(key: key);
final OrgKycModel orgKycModel;

  @override
  State<OrgOtherTextfiled> createState() => _OrgOtherTextfiledState();
}

class _OrgOtherTextfiledState extends State<OrgOtherTextfiled> {
  final _formKey = GlobalKey<FormState>();
  bool isIdentificationTypeSelected = true;

  final occupation = TextEditingController();
  final hobbies = TextEditingController();
  final expertise= TextEditingController();
  final bloodgroup= TextEditingController();

  String identificationType = 'Identification Type';


  late List<String> identificationTypeList = [
'Identification Type',
    '+2',
    'Bachelor',
    'Master',
    'PHD',
    // 'Business Registration Certificate',
  ];


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTitleText(text: "Other",),
          TextSizeBox(),
          TextFieldText(text: 'Occupation',),
          TextFormField(
              controller: occupation,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Occupation";
                }
                return null;
              },
              decoration:customDecoration("Occupation", "",)),
          TextSizeBox(),

          TextFieldText(text: 'Highest Education',),
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 5.0),
              decoration:customDropDownDecoration(),
              height: 50,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: identificationType,
                  iconSize: 30,
                  elevation: 16,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    // setState(() {
                    identificationType = newValue!;
                    if (identificationType == "Highest Education") {
                    } else {
                      setState(() {
                        isIdentificationTypeSelected = true;
                      });
                    }
                    // });
                  },
                  items: identificationTypeList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )),
          TextSizeBox(),
          TextFieldText(text: 'Hobbies',),
          TextFormField(
              controller: hobbies,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Hobbies";
                }
                return null;
              },
              decoration:customDecoration("Hobbies", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Expertise',),
          TextFormField(
              controller: expertise,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Expertise";
                }
                return null;
              },
              decoration:customDecoration("Expertise", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Blood Group',),
          TextFormField(
              controller: bloodgroup,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Blood Group";
                }
                return null;
              },
              decoration:customDecoration("O+", "",)),
          TextSizeBox(),
          SizedBox(height: 40,),

          Row(
            children: [
              Spacer(),
              BackButtons(
                text: "Back",
                press: (){ Navigator.pop(context);},
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              NextButton(
                text: "Next",
                press:() async {
                 

                  if (_formKey.currentState!.validate()){
                     Get.to(()=>OrgPreviewScreen(orgKycModel: OrgKycModel(
                       aadharcardback: widget.orgKycModel.aadharcardback,
                   citizenshipback: widget.orgKycModel.citizenshipback,
                          citizenshipfront: widget.orgKycModel.citizenshipfront,
                          aadharcardfront: widget.orgKycModel.aadharcardfront,
                          panfile: widget.orgKycModel.panfile,
                          passportPanfile: widget.orgKycModel.passportPanfile,
                          voterfile: widget.orgKycModel.voterfile,
                          orgName: widget.orgKycModel.orgName,
                          estyear: widget.orgKycModel.estyear,
                          registernuber: widget.orgKycModel.registernuber,
                          identityNumber: widget.orgKycModel.identityNumber,
                          identityType: widget.orgKycModel.identityType,
                          emailAddress: widget.orgKycModel.emailAddress,
                          primaryMobileNumber: widget.orgKycModel.primaryMobileNumber,
                          secondaryMobileNumber: widget.orgKycModel.secondaryMobileNumber,
                          website: widget.orgKycModel.website,
                           permanentAddressCountry: widget.orgKycModel.permanentAddressCountry,
                          permanentAddressDistrict: widget.orgKycModel.permanentAddressDistrict,
                          permanentAddressState: widget.orgKycModel.permanentAddressState,
                          permanentAddressMunicipality: widget.orgKycModel.permanentAddressMunicipality,
                          permanentAddressWardNo: widget.orgKycModel.permanentAddressWardNo,
                          permanentAddressCityVillageArea: widget.orgKycModel.permanentAddressCityVillageArea,
                          bloodGroup: bloodgroup.text,
                          expertise: expertise.text,
                          grandfatherName: widget.orgKycModel.grandfatherName,
                          highestEducation: identificationType,
                          hobbies: hobbies.text,
                          occupation: occupation.text,
                          whatsappViberNumber: widget.orgKycModel.whatsappViberNumber
                     )));
                  }
                },
              ),
              Spacer(),



            ],
          )

        ],
      ),
    );
  }
}




