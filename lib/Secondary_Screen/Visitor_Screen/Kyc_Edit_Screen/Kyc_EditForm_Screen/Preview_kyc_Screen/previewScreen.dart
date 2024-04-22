import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Service/service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import '../../Service/kycEditService.dart';
import '../Models/kyc_Edit_from_model.dart';
import 'Widgets/containerDecoration.dart';


class EditPreviewBody extends StatefulWidget {

  final KycEditFromModel kycFromModel;
  EditPreviewBody({Key? key,  required this.kycFromModel}) : super(key: key);

  @override
  State<EditPreviewBody> createState() => _EditPreviewBodyState();
}

class _EditPreviewBodyState extends State<EditPreviewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitleText(text: "Preview KYC Details",),
        ///Identity Detials
        TextSizeBox(),
        Container(
          height: Get.height*0.7,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(text: "Identity Details",),

                  Spacer(),

                  PreviewText(nametext: "Name:", maintext:"${widget.kycFromModel.name}"),
                  Spacer(),
                  PreviewText(nametext: "Father Name:", maintext:"${widget.kycFromModel.fatherName}"),
                  Spacer(),
                  PreviewText(nametext: "Mother Name:", maintext:"${widget.kycFromModel.motherName}"),
                  Spacer(),
                  PreviewText(nametext: "Grandfather Name:", maintext:"${widget.kycFromModel.grandfatherName}"),
                  Spacer(),
                  PreviewText(nametext: "Marital Status:", maintext:"${widget.kycFromModel.maritalStatus}"),
                  Spacer(),
                  PreviewText(nametext: "Gender:", maintext:"${widget.kycFromModel.gender}"),
                  Spacer(),
                  PreviewText(nametext: "Nationality:", maintext:"${widget.kycFromModel.nationality}"),
                  Spacer(),
                  PreviewText(nametext: "Identity Type:", maintext:"${widget.kycFromModel.identityType}"),
                  Spacer(),
                  PreviewText(nametext: "Identity Number:", maintext:"${widget.kycFromModel.identityNumber}"),
                  Spacer(),
                  PreviewText(nametext: "Identity Documents:", maintext:"${widget.kycFromModel.name}"),
                  Spacer(),
    //                 'Identification Type',
    // 'Citizenship',
    // 'Passport',
    // 'PAN',
    // 'Voter ID',
                  if(widget.kycFromModel.identityType=="Passport")...[
                    Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width /
                                    2.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(widget
                                        .kycFromModel.passportPanfile!)),
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
                  ] 
                  else if(widget.kycFromModel.identityType=="Citizenship")...[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width /
                                    2.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(widget
                                        .kycFromModel.citizenshipfront!)),
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
                                width: MediaQuery.of(context).size.width /
                                    2.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(widget
                                        .kycFromModel.citizenshipback!)),
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
                  ]  else if(widget.kycFromModel.identityType=="Voter ID")...[
                 Container(
                             height: 200,
                             width: MediaQuery.of(context).size.width /
                                 2.5,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: FileImage(File(widget
                                     .kycFromModel.voterfile!)),
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
                  ] else if(widget.kycFromModel.identityType=="PAN")...[
                 Container(
                             height: 200,
                             width: MediaQuery.of(context).size.width /
                                 2.5,
                             decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: FileImage(File(widget
                                     .kycFromModel.panfile!)),
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
                  Spacer(),

                ],
              ),
            )),
        ///Contact
        TextSizeBox(),
        TextSizeBox(),
        Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(text: "Contact",),

                  Spacer(),
                  PreviewText(nametext: "Primary Mobile Number:", maintext:"${widget.kycFromModel.name}"),
                  Spacer(),
                  PreviewText(nametext: "Secondary Mobile Number:", maintext:"${widget.kycFromModel.secondaryMobileNumber}"),
                  Spacer(),
                  PreviewText(nametext: "Email Address:", maintext:"${widget.kycFromModel.emailAddress}"),
                  Spacer(),
                  PreviewText(nametext: "Whatsapp/Viber Number:", maintext:"${widget.kycFromModel.whatsappViberNumber}"),
                  Spacer(),


                ],
              ),
            )),
        ///Permanent Address
        TextSizeBox(),
        TextSizeBox(),
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(text: "Permanent Address",),

                  Spacer(),
                  PreviewText(nametext: "Country:", maintext:"${widget.kycFromModel.currentAddressCountry}"),
                  Spacer(),
                  PreviewText(nametext: "State:", maintext:"${widget.kycFromModel.currentAddressState}"),
                  Spacer(),
                  PreviewText(nametext: "District:", maintext:"${widget.kycFromModel.currentAddressDistrict}"),
                  Spacer(),
                  PreviewText(nametext: "Municipality:", maintext:"${widget.kycFromModel.currentAddressMunicipality}"),
                  Spacer(),
                  PreviewText(nametext: "City/Village/Area:", maintext:"${widget.kycFromModel.currentAddressCityVillageArea}"),
                  Spacer(),
                  PreviewText(nametext: "Ward No:", maintext:"${widget.kycFromModel.currentAddressWardNo}"),
                  Spacer(),
                ],
              ),
            )),
        ///Current Address
        TextSizeBox(),
        TextSizeBox(),
        Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(text: "Current Address",),

                  Spacer(),
                  PreviewText(nametext: "Country:", maintext:"${widget.kycFromModel.currentAddressCountry}"),
                  Spacer(),
                  PreviewText(nametext: "State:", maintext:"${widget.kycFromModel.currentAddressState}"),
                  Spacer(),
                  PreviewText(nametext: "District:", maintext:"${widget.kycFromModel.currentAddressDistrict}"),
                  Spacer(),
                  PreviewText(nametext: "Municipality:", maintext:"${widget.kycFromModel.currentAddressMunicipality}"),
                  Spacer(),
                  PreviewText(nametext: "City/Village/Area:", maintext:"${widget.kycFromModel.currentAddressCityVillageArea}"),
                  Spacer(),
                  PreviewText(nametext: "Ward No:", maintext:"${widget.kycFromModel.currentAddressWardNo}"),
                  Spacer(),


                ],
              ),
            )),
        ///Other
        TextSizeBox(),
        TextSizeBox(),
        Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: previewBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormTitleText(text: "Other",),

                  Spacer(),
                  PreviewText(nametext: "Occupation:", maintext:"${widget.kycFromModel.occupation}"),
                  Spacer(),
                  PreviewText(nametext: "Highest Education:", maintext:"${widget.kycFromModel.highestEducation}"),
                  Spacer(),
                  PreviewText(nametext: "Hobbies:", maintext:"${widget.kycFromModel.hobbies}"),
                  Spacer(),
                  PreviewText(nametext: "Expertise:", maintext:"${widget.kycFromModel.expertise}"),
                  Spacer(),
                  PreviewText(nametext: "Blood Group:", maintext:"${widget.kycFromModel.bloodGroup}"),



                ],
              ),
            )),
        SizedBox(height: 50,),
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
              text: "Submit KYC",
              press:() async {

                // Navigator.pushNamed(context, Routes.homepageScreen);
                uploadEditKycForm(
                   kycEditFromModel:widget.kycFromModel, context: context);

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
