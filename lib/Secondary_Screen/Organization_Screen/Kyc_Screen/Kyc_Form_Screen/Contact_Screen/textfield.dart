import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

class OrgContactTextField extends StatefulWidget {
  final OrgKycModel orgKycModel;
  const OrgContactTextField({Key? key, required this.orgKycModel})
      : super(key: key);

  @override
  State<OrgContactTextField> createState() => _ContactTextFieldState();
}

void sendData() {
  final primaryNumberValue = primarynumber.text;
  final secondaryNumberValue = secondarynumber.text;
  final emailValue = email.text;
  final viberNumberValue = vibernumber.text;

  // Now you can use these values as needed, such as printing them.
  print('Primary Mobile Number: $primaryNumberValue');
  print('Secondary Mobile Number: $secondaryNumberValue');
  print('Email: $emailValue');
  print('Viber Number: $viberNumberValue');
}

final _formKey = GlobalKey<FormState>();
final primarynumber = TextEditingController();
final secondarynumber = TextEditingController();
final email = TextEditingController();
final vibernumber = TextEditingController();
final website = TextEditingController();

class _ContactTextFieldState extends State<OrgContactTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTitleText(
            text: "Contact",
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'Primary Mobile Number',
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: primarynumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration: customDecoration(
                " Mobile Number",
                "",
              )),

          TextSizeBox(),
          TextFieldText(
            text: 'Secondary Mobile Number',
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: secondarynumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration: customDecoration(
                " Mobile Number",
                "",
              )),
          TextSizeBox(),
          // TextFieldText(text: 'Primary Mobile Number',),
          // TextFormField(
          //     controller: email,
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "Please Enter Mobile Number";
          //       }
          //       return null;
          //     },
          //     decoration:customDecoration(" Mobile Number", "",)),
          // TextSizeBox(),
          TextFieldText(
            text: 'Email Address',
          ),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Email Address";
                }
                return null;
              },
              decoration: customDecoration(
                "Email Address",
                "",
              )),
          TextSizeBox(),

          TextFieldText(
            text: 'Whatsapp/Viber Number',
          ),
          TextFormField(
              keyboardType: TextInputType.number,
              controller: vibernumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Whatsapp/Viber Number";
                }
                return null;
              },
              decoration: customDecoration(
                "Please Enter Whatsapp/Viber Number",
                "",
              )),
          TextSizeBox(),
          TextFieldText(
            text: 'Website',
          ),

          TextFormField(
              controller: website,
              keyboardType: TextInputType.url,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Website";
                }
                return null;
              },
              decoration: customDecoration(
                "Website",
                "",
              )),
          TextSizeBox(),
          // TextFieldText(text: 'Whatsapp/Viber Number',),

          // TextFormField(
          //     controller: vibernumber,
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "Please Enter Social Media Link";
          //       }
          //       return null;
          //     },
          //     decoration:customDecoration("Please Enter Social Media Link", "",)),
          SizedBox(
            height: 90,
          ),
          Row(
            children: [
              Spacer(),
              BackButtons(
                text: "Back",
                press: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              NextButton(
                text: "Next",
                press: () async {
                  sendData();
                  // Navigator.pushNamed(context, Routes.orgotherScreen);

                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressScreen(
                            orgKycModel: OrgKycModel(
                                aadharcardback:
                                    widget.orgKycModel.aadharcardback,
                                citizenshipback:
                                    widget.orgKycModel.citizenshipback,
                                citizenshipfront:
                                    widget.orgKycModel.citizenshipfront,
                                aadharcardfront:
                                    widget.orgKycModel.aadharcardfront,
                                panfile: widget.orgKycModel.panfile,
                                passportPanfile:
                                    widget.orgKycModel.passportPanfile,
                                voterfile: widget.orgKycModel.voterfile,
                                orgName: widget.orgKycModel.orgName,
                                grandfatherName:
                                    widget.orgKycModel.grandfatherName,
                                estyear: widget.orgKycModel.estyear,
                                registernuber: widget.orgKycModel.registernuber,
                                identityNumber:
                                    widget.orgKycModel.identityNumber,
                                identityType: widget.orgKycModel.identityType,
                                primaryMobileNumber: primarynumber.text,
                                secondaryMobileNumber: secondarynumber.text,
                                emailAddress: email.text,
                                whatsappViberNumber: vibernumber.text,
                                website: website.text,
                                pannumber: widget.orgKycModel.pannumber,
                                vatnumber: widget.orgKycModel.vatnumber),
                          ),
                        ));
                  }
                },
              ),
              Spacer(),
              SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}
