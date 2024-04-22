import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Preview_kyc_Screen/widgets/containerDecoration.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/service/org_kyc_service.dart';

import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/routes.dart';

class OrgPreviewBody extends StatelessWidget {
  const OrgPreviewBody({Key? key, required this.orgKycModel}) : super(key: key);
  final OrgKycModel orgKycModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitleText(
          text: "Preview KYC Details",
        ),

        ///Identity Detials
        TextSizeBox(),
        Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(
                    text: "Identity Details",
                  ),

                  Spacer(),
                  PreviewText(
                      nametext: "Organization name",
                      maintext: orgKycModel.orgName!),
                  Spacer(),
                  PreviewText(
                      nametext: "Establishment Year",
                      maintext: orgKycModel.estyear!),
                  Spacer(),
                  PreviewText(
                      nametext: "Registration Number",
                      maintext: orgKycModel.registernuber!),
                  // Spacer(),
                  // PreviewText(nametext: "Grandfather Name:", maintext:orgKycModel.grandfatherName!),

                  // Spacer(),
                  // PreviewText(nametext: "Identity Type:", maintext:"Kripas Khatiwada"),
                  Spacer(),
                  PreviewText(
                      nametext: "Identity Number:",
                      maintext: orgKycModel.identityNumber!),
                  Spacer(),
                  PreviewText(
                      nametext: "PAN Number:",
                      maintext: orgKycModel.pannumber!),
                  Spacer(),
                  PreviewText(
                      nametext: "VAT Number:",
                      maintext: orgKycModel.vatnumber!),
                  Spacer(),
                  PreviewText(
                      nametext: "Identity Documents:",
                      maintext: orgKycModel.identityType!),
                  Spacer(),
                  if (orgKycModel.identityType == "Passport") ...[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(orgKycModel.passportPanfile!)),
                          fit: BoxFit.fitWidth,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Passport",
                          style: TextStyle(
                              color: Color(0xff138fb4),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ] else if (orgKycModel.identityType == "Citizenship") ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                  File(orgKycModel.citizenshipfront!)),
                              fit: BoxFit.fitWidth,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Citizenship Front",
                              style: TextStyle(
                                  color: Color(0xff138fb4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  FileImage(File(orgKycModel.citizenshipback!)),
                              fit: BoxFit.fitWidth,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Citizenship Back",
                              style: TextStyle(
                                  color: Color(0xff138fb4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ] else if (orgKycModel.identityType == "Voter ID") ...[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(orgKycModel.voterfile!)),
                          fit: BoxFit.fitWidth,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Voter ID",
                          style: TextStyle(
                              color: Color(0xff138fb4),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ] else if (orgKycModel.identityType == "PAN") ...[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(orgKycModel.panfile!)),
                          fit: BoxFit.fitWidth,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "PAN",
                          style: TextStyle(
                              color: Color(0xff138fb4),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ],
              ),
            )),

//         ///Contact
//         TextSizeBox(),
        TextSizeBox(),
        Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(
                    text: "Contact",
                  ),

                  Spacer(),
                  PreviewText(
                      nametext: "Primary Mobile Number:",
                      maintext: orgKycModel.primaryMobileNumber!),
                  Spacer(),
                  PreviewText(
                      nametext: "Secondary Mobile Number:",
                      maintext: orgKycModel.secondaryMobileNumber!),
                  Spacer(),
                  PreviewText(
                      nametext: "Email Address:",
                      maintext: orgKycModel.emailAddress!),
//                   Spacer(),
                  // PreviewText(nametext: "Whatsapp/Viber Number:", maintext:orgKycModel.whatsappViberNumber!),
                  Spacer(),
                  PreviewText(
                      nametext: "Website:", maintext: orgKycModel.website!),
                  Spacer(),
                ],
              ),
            )),

//         ///Permanent Address
//         TextSizeBox(),
        TextSizeBox(),
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(
                    text: "Permanent Address",
                  ),
                  Spacer(),
                  PreviewText(
                      nametext: "Country:",
                      maintext: orgKycModel.permanentAddressCountry!),
                  Spacer(),
                  PreviewText(
                      nametext: "State:",
                      maintext: orgKycModel.permanentAddressState!),
                  Spacer(),
                  PreviewText(
                      nametext: "District:",
                      maintext: orgKycModel.permanentAddressDistrict!),
                  Spacer(),
                  PreviewText(
                      nametext: "Municipality:",
                      maintext: orgKycModel.permanentAddressMunicipality!),
                  Spacer(),
                  PreviewText(
                      nametext: "City/Village/Area:",
                      maintext: orgKycModel.permanentAddressCityVillageArea!),
                  Spacer(),
                  PreviewText(
                      nametext: "Ward No:",
                      maintext: orgKycModel.permanentAddressWardNo!),
                  Spacer(),
                ],
              ),
            )),

        ///Current Address
        TextSizeBox(),
        TextSizeBox(),
        // Container(
        //     height: 160,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: previewBoxDecoration(),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 5,right: 5),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           FormTitleText(text: "Current Address",),

        //           Spacer(),
        //           PreviewText(nametext: "Country:", maintext:"Kripas Khatiwada"),
        //           Spacer(),
        //           PreviewText(nametext: "State:", maintext:"Kripas Khatiwada"),
        //           Spacer(),
        //           PreviewText(nametext: "District:", maintext:"Kripas Khatiwada"),
        //           Spacer(),
        //           PreviewText(nametext: "Municipality:", maintext:"Kripas Khatiwada"),
        //           Spacer(),
        //           PreviewText(nametext: "City/Village/Area:", maintext:"Kripas Khatiwada"),
        //           Spacer(),
        //           PreviewText(nametext: "Ward No:", maintext:"Kripas Khatiwada"),
        //           Spacer(),

        //         ],
        //       ),
        //     )),
        ///Other
        TextSizeBox(),
        TextSizeBox(),
        // Container(
        //     height: 160,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: previewBoxDecoration(),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 5,right: 0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           FormTitleText(text: "Other",),

        //           Spacer(),
        //           PreviewText(nametext: "Occupation:", maintext:orgKycModel.occupation!),
        //           Spacer(),
        //           PreviewText(nametext: "Highest Education:", maintext:orgKycModel.highestEducation!),
        //           Spacer(),
        //           PreviewText(nametext: "Hobbies:", maintext:orgKycModel.hobbies!),
        //           Spacer(),
        //           PreviewText(nametext: "Expertise:", maintext:orgKycModel.expertise!),
        //           Spacer(),
        //           PreviewText(nametext: "Blood Group:", maintext:orgKycModel.bloodGroup!),

        //         ],
        //       ),
        //     )),
        SizedBox(
          height: 50,
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
              text: "Submit KYC",
              press: () async {
                OrgKycService()
                    .uploadKycForm(kycFromModel: orgKycModel, context: context);
                // Navigator.pushNamed(context, Routes.orghomepageScreen);

                // Navigator.pushNamed(context, Routes.);
              },
            ),
            Spacer(),
          ],
        )
      ],
    );
  }
}
