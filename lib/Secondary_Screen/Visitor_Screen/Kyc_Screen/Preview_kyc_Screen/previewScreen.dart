import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Service/service.dart';

import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/routes.dart';

import '../Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'Widgets/containerDecoration.dart';


class PreviewBody extends StatefulWidget {

  final KycFromModel kycFromModel;
  PreviewBody({Key? key, required this.kycFromModel}) : super(key: key);

  @override
  State<PreviewBody> createState() => _PreviewBodyState();
}

class _PreviewBodyState extends State<PreviewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                height: 60,
                width: 400,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    end: Alignment(-1.00, -0.05),
                    begin: Alignment(1, 0.05),
                    colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 8),
                child: Theme(
                  data: ThemeData(dividerColor: Colors.transparent),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "Personal Details",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(Icons.emoji_emotions_outlined, color: primaryColor),
                      iconColor: Colors.black,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align children text to start
                          children: [
                            PreviewPageText(nametext: "Name", maintext: "${widget.kycFromModel.name}", icon: Icons.perm_identity,),
                            PreviewPageText(nametext: "Mobile Number", maintext: "${widget.kycFromModel.secondaryMobileNumber}", icon: Icons.phone_android_rounded,),
                            PreviewPageText(nametext: "Email Address", maintext: "${widget.kycFromModel.emailAddress}",icon: Icons.email_outlined),
                            PreviewPageText(nametext: "Date of Birth", maintext: "${widget.kycFromModel.dob}", icon: Icons.date_range_outlined),
                            PreviewPageText(nametext: "Gender", maintext: "${widget.kycFromModel.gender}", icon: Icons.transgender),
                            PreviewPageText(nametext: "Grandfather Full Name", maintext: "${widget.kycFromModel.grandfatherName}", icon: Icons.perm_identity,),
                            PreviewPageText(nametext: "Father Full Name", maintext: "${widget.kycFromModel.fatherName}", icon: Icons.perm_identity,),
                            PreviewPageText(nametext: "Mother Full Name:", maintext: "${widget.kycFromModel.motherName}", icon: Icons.perm_identity),
                            PreviewPageText(nametext: "Marital Status", maintext: "${widget.kycFromModel.maritalStatus}", icon: Icons.man_rounded,),
                            PreviewPageText(nametext: "Occupation", maintext: "${widget.kycFromModel.occupation}", icon: Icons.business_center,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ),

          ],
        ),
        TextSizeBox(),
        Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                height: 60,
                width: 400,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    end: Alignment(-1.00, -0.05),
                    begin: Alignment(1, 0.05),
                    colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 8),
                child: Theme(
                  data: ThemeData(dividerColor: Colors.transparent),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "Address",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(Icons.location_on_outlined, color: primaryColor),
                      iconColor: Colors.black,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align children text to start
                          children: [
                            FormTitleText(text: "Permanent Address",),
                            PreviewPageText(nametext: "Country", maintext:"${widget.kycFromModel.permanentAddressCountry}", icon: Icons.flag),
                            PreviewPageText(nametext: "Province / State", maintext:"${widget.kycFromModel.permanentAddressState}", icon: Icons.location_searching),
                            PreviewPageText(nametext: "District", maintext:"${widget.kycFromModel.permanentAddressDistrict}", icon: Icons.share_location_outlined),
                            PreviewPageText(nametext: "Municipality / Rural Municipality", maintext:"${widget.kycFromModel.permanentAddressMunicipality}", icon: Icons.location_on_outlined),
                            PreviewPageText(nametext: "Ward", maintext:"${widget.kycFromModel.permanentAddressWardNo}", icon: Icons.numbers_rounded),
                            SizedBox(height: 30),

                            FormTitleText(text: "Temporary Address",),
                            PreviewPageText(nametext: "Country", maintext:"${widget.kycFromModel.currentAddressCountry}", icon: Icons.flag),
                            PreviewPageText(nametext: "Province / State", maintext:"${widget.kycFromModel.currentAddressState}", icon: Icons.location_searching),
                            PreviewPageText(nametext: "District", maintext:"${widget.kycFromModel.currentAddressDistrict}", icon: Icons.share_location_outlined),
                            PreviewPageText(nametext: "Municipality / Rural Municipality", maintext:"${widget.kycFromModel.currentAddressMunicipality}", icon: Icons.location_on_outlined),
                            PreviewPageText(nametext: "Ward", maintext:"${widget.kycFromModel.currentAddressWardNo}", icon: Icons.numbers_rounded),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ),

          ],
        ),
        TextSizeBox(),
        Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                height: 60,
                width: 400,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    end: Alignment(-1.00, -0.05),
                    begin: Alignment(1, 0.05),
                    colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 8),
                child: Theme(
                  data: ThemeData(dividerColor: Colors.transparent),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "Verification Documents",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(Icons.emoji_emotions_outlined, color: primaryColor),
                      iconColor: Colors.black,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align children text to start
                          children: [
                            PreviewPageText(nametext: "Identity Type:", maintext:"${widget.kycFromModel.identityType}", icon: Icons.quick_contacts_dialer_rounded),
                            PreviewPageText(nametext: "Identity Number:", maintext:"${widget.kycFromModel.identityNumber}", icon: Icons.quick_contacts_dialer_rounded),
                            PreviewPageText(nametext: "Identity Documents:", maintext:"${widget.kycFromModel.name}", icon: Icons.quick_contacts_dialer_rounded),
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
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ),

          ],
        ),
        TextSizeBox(),
        SizedBox(height: 50,),
        DefaultButton(
          text: "Submit KYC",
          press:() async {
            uploadKycForm(
                kycFromModel:widget.kycFromModel, context: context);
          },
        ),
        // Row(
        //   children: [
        //     Spacer(),
        //     BackButtons(
        //       text: "Back",
        //       press: (){ Navigator.pop(context);},
        //     ),
        //     Spacer(),
        //     Spacer(),
        //     Spacer(),
        //     NextButton(
        //       text: "Submit KYC",
        //       press:() async {
        //         uploadKycForm(
        //             kycFromModel:widget.kycFromModel, context: context);
        //       },
        //     ),
        //     Spacer(),
        //
        //
        //
        //   ],
        // )

    ],
    );
  }
}
