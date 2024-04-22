import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Exception/validation.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

class ContactTextField extends StatefulWidget {
  final KycFromModel kycFromModel;
  const ContactTextField({Key? key, required this.kycFromModel})
      : super(key: key);

  @override
  State<ContactTextField> createState() => _ContactTextFieldState();
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
class _ContactTextFieldState extends State<ContactTextField> {


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('Name: ${widget.kycFromModel.nationality}'),

          TextSizeBox(),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '02/',
                      style: TextStyle(
                        color: Color(0xFF0F75BC),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                      ),
                    ),
                    TextSpan(
                      text: '03',
                      style: TextStyle(
                        color: Color(0xFF898989),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0.17,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                'Next: ID Verification',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF898989),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),
              ),
            ],
          ),
          TextSizeBox(),
          TextSizeBox(),
          FormTitleText(
            text: "Permanent Address",
          ),
          TextSizeBox(),

          TextFormField(
            maxLength: 10,
            controller: primarynumber,
            validator: validateMobile,
            decoration: customDecoration(
              " Mobile Number",
              "",
            ),
          ),

          TextSizeBox(),
          TextFieldText(
            text: 'Secondary Mobile Number',
          ),
          TextFormField(
              maxLength: 10,
              controller: secondarynumber,
              validator: validateMobile,
              decoration: customDecoration(
                " Mobile Number",
                "",
              )),
          TextSizeBox(),
          TextFieldText(
            text: 'Email Address',
          ),
          TextFormField(
              controller: email,
              validator: validateEmail,
              decoration: customDecoration(
                " Email",
                "",
              )),
          TextSizeBox(),
          // TextFieldText(
          //   text: 'Primary Mobile Number',
          // ),
          // TextFormField(
          //     controller: vibernumber,
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "Whatsapp/Viber Number";
          //       }
          //       return null;
          //     },
          //     decoration: customDecoration(
          //       " Mobile Number",
          //       "",
          //     )),
          SizedBox(
            height: 170,
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
                  if (_formKey.currentState!.validate()) {
                    Get.to(() => VisitorAddressScreen(
                        kycFromModel: KycFromModel(
                            secondaryMobileNumber: secondarynumber.text,
                            emailAddress: email.text,
                            whatsappViberNumber: vibernumber.text,
                            name: widget.kycFromModel.name,
                            fatherName: widget.kycFromModel.fatherName,
                            motherName: widget.kycFromModel.motherName,
                            grandfatherName:
                                widget.kycFromModel.grandfatherName,
                            gender: widget.kycFromModel.gender,
                            nationality: widget.kycFromModel.nationality,
                            citizenshipback:
                                widget.kycFromModel.citizenshipback,
                            citizenshipfront:
                                widget.kycFromModel.citizenshipfront,
                            aadharcardback: widget.kycFromModel.aadharcardback,
                            aadharcardfront:
                                widget.kycFromModel.aadharcardfront,
                            panfile: widget.kycFromModel.panfile,
                            passportPanfile:
                                widget.kycFromModel.passportPanfile,
                            voterfile: widget.kycFromModel.voterfile,
                            maritalStatus: widget.kycFromModel.maritalStatus,
                            identityNumber: widget.kycFromModel.identityNumber,
                            identityType: widget.kycFromModel.identityType))
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
