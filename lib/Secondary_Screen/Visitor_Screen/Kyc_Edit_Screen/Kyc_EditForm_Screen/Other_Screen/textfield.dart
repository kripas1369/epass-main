import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Preview_kyc_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/LoginDetailsService.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

import '../Models/kyc_Edit_from_model.dart';
import '../Preview_kyc_Screen/body.dart';



class EditOtherTextfiled extends StatefulWidget {
  final KycEditFromModel kycFromModel;
  EditOtherTextfiled ({Key? key, required this.kycFromModel}) : super(key: key);

  @override
  State<EditOtherTextfiled> createState() => _EditOtherTextfiledState();
}

class _EditOtherTextfiledState extends State<EditOtherTextfiled> {
  final _formKey = GlobalKey<FormState>();
  bool isIdentificationTypeSelected = true;

  final TextEditingController occupation= TextEditingController(text: "Doc");
  final TextEditingController highestEdu= TextEditingController(text: "+2");
  final TextEditingController hobbies= TextEditingController(text: "developer");
  final TextEditingController expertise= TextEditingController(text: "de");
  final TextEditingController bloodGroup= TextEditingController(text: "O+");

  String educationType = 'Identification Type';


  late List<String> identificationTypeList = [
    'Identification Type',
    '+2',
    'Bachelor',
    'Master',
    'PHD',
    // 'Business Registration Certificate',
  ];

@override
  void initState() {
    print(widget.kycFromModel.bloodGroup);
   occupation.text=widget.kycFromModel.occupation!;
   educationType=widget.kycFromModel.highestEducation!;
   hobbies.text=widget.kycFromModel.hobbies!;
   expertise.text=widget.kycFromModel.expertise!;
   bloodGroup.text=widget.kycFromModel.bloodGroup!;
   setState(() {
     
   });
    super.initState();
  }
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
                  value: educationType,
                  iconSize: 30,
                  elevation: 16,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    // setState(() {
                    educationType = newValue!;
                    if (educationType == "Highest Education") {
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
              controller: bloodGroup,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Grandfather Name";
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
                  // Navigator.pushNamed(context, Routes.previewScreen);


                 if (_formKey.currentState!.validate()){
                    Get.to(()=>EditPreviewScreen(
                        kycFromModel: KycEditFromModel(
                          occupation: occupation.text,
                          highestEducation: educationType,
                          hobbies: hobbies.text,
                          expertise: expertise.text,
                          bloodGroup: bloodGroup.text,
                            currentAddressCountry: widget.kycFromModel.currentAddressCountry,
                            currentAddressState:  widget.kycFromModel.currentAddressState,
                            currentAddressDistrict:  widget.kycFromModel.currentAddressDistrict,
                            currentAddressMunicipality:  widget.kycFromModel.currentAddressMunicipality,
                            currentAddressCityVillageArea:  widget.kycFromModel.currentAddressCityVillageArea,
                            currentAddressWardNo:  widget.kycFromModel.currentAddressWardNo,
                            secondaryMobileNumber: widget.kycFromModel.secondaryMobileNumber,
                            emailAddress: widget.kycFromModel.emailAddress,
                            whatsappViberNumber: widget.kycFromModel.whatsappViberNumber,
                            name: widget.kycFromModel.name,
                            fatherName: widget.kycFromModel.fatherName,
                            citizenshipback: widget.kycFromModel.citizenshipback,
                          citizenshipfront: widget.kycFromModel.citizenshipfront,
                          aadharcardback: widget.kycFromModel.aadharcardback,
                          aadharcardfront: widget.kycFromModel.aadharcardfront,
                          panfile: widget.kycFromModel.panfile,
                          passportPanfile: widget.kycFromModel.passportPanfile,
                          voterfile: widget.kycFromModel.voterfile,
                            motherName: widget.kycFromModel.motherName,
                            grandfatherName: widget.kycFromModel.grandfatherName,
                            gender:widget.kycFromModel.gender,
                            nationality:widget.kycFromModel.nationality,
                            maritalStatus: widget.kycFromModel.maritalStatus,
                            identityNumber: widget.kycFromModel.identityNumber,
                            identityType: widget.kycFromModel.identityType



                        ))
                    );
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




