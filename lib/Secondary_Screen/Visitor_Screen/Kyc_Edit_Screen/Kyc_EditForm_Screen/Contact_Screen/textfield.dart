import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

import '../Address_Screen/body.dart';

class EditContactTextField extends StatefulWidget {
  final KycFromModel kycFromModel;
  const EditContactTextField({Key? key, required this.kycFromModel}) : super(key: key);

  @override
  State<EditContactTextField> createState() => _EditContactTextFieldState();
}

final _formKey = GlobalKey<FormState>();

final TextEditingController primarynumber = TextEditingController();
final TextEditingController secondarynumber = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController vibernumber = TextEditingController();
// final TextEditingController primarynumber = TextEditingController();
// final TextEditingController secondarynumber = TextEditingController();
// final TextEditingController email = TextEditingController();
// final TextEditingController vibernumber = TextEditingController();

class _EditContactTextFieldState extends State<EditContactTextField> {
  @override
  void initState() {
    print(widget.kycFromModel.emailAddress);
    primarynumber.text=widget.kycFromModel.secondaryMobileNumber!;
    secondarynumber.text=widget.kycFromModel.secondaryMobileNumber!;
    email.text=widget.kycFromModel.emailAddress!;
    vibernumber.text=widget.kycFromModel.whatsappViberNumber!;
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
          // Text('Name: ${widget.kycFromModel.nationality}'),


          FormTitleText(text: "Contact",),
          TextSizeBox(),
          TextFieldText(text: 'Primary Mobile Number',),
          TextFormField(
              controller: primarynumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration:customDecoration(" Mobile Number", "",)),

          TextSizeBox(),
          TextFieldText(text: 'Secondary Mobile Number',),
          TextFormField(
              controller: secondarynumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration:customDecoration(" Mobile Number", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Email Address',),
          TextFormField(
              controller: email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Email";
                }
                return null;
              },
              decoration:customDecoration(" Email", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Primary Mobile Number',),
          TextFormField(
              controller: vibernumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Whatsapp/Viber Number";
                }
                return null;
              },
              decoration:customDecoration(" Mobile Number", "",)),
          SizedBox(height: 170,),
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
                    Get.to(()=>EditVisitorAddressScreen(
                        kycFromModel: KycFromModel(
                          secondaryMobileNumber: secondarynumber.text,
                          emailAddress: email.text,
                          bloodGroup: widget.kycFromModel.bloodGroup,
                           currentAddressCountry: widget.kycFromModel.currentAddressCountry,
                    currentAddressState: widget.kycFromModel.currentAddressState,
                    currentAddressCityVillageArea: widget.kycFromModel.currentAddressCityVillageArea,
                    currentAddressDistrict: widget.kycFromModel.currentAddressDistrict,
                    currentAddressMunicipality: widget.kycFromModel.currentAddressMunicipality,
                    currentAddressWardNo: widget.kycFromModel.currentAddressWardNo,
                    expertise: widget.kycFromModel.expertise,
                    occupation: widget.kycFromModel.occupation,
                    highestEducation: widget.kycFromModel.highestEducation,
                    hobbies: widget.kycFromModel.hobbies,
                          whatsappViberNumber: vibernumber.text,
                          name: widget.kycFromModel.name,
                          fatherName: widget.kycFromModel.fatherName,
                          motherName: widget.kycFromModel.motherName,
                          grandfatherName: widget.kycFromModel.grandfatherName,
                          gender:widget.kycFromModel.gender,
                          nationality:widget.kycFromModel.nationality,
                          citizenshipback: widget.kycFromModel.citizenshipback,
                          citizenshipfront: widget.kycFromModel.citizenshipfront,
                          aadharcardback: widget.kycFromModel.aadharcardback,
                          aadharcardfront: widget.kycFromModel.aadharcardfront,
                          panfile: widget.kycFromModel.panfile,
                          passportPanfile: widget.kycFromModel.passportPanfile,
                          voterfile: widget.kycFromModel.voterfile,
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
