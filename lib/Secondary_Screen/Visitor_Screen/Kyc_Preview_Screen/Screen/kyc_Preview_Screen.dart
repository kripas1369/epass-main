import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Edit_Screen/Kyc_EditForm_Screen/Models/kyc_Edit_from_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Model/model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Edit_Screen/kyc_Edit_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Service/kycService.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';

import '../../Kyc_Screen/Preview_kyc_Screen/Widgets/containerDecoration.dart';

class KYCUpdateForm extends StatefulWidget {
  get kycData => null;

  @override
  _KYCUpdateFormState createState() => _KYCUpdateFormState();
}

class _KYCUpdateFormState extends State<KYCUpdateForm> {
  KYCDataModel? kycData;
  KYCService kycService =
      KYCService(); // Replace with your correct service class

  @override
  void initState() {
    super.initState();
    kycService.fetchKYCData().then((data) {
      setState(() {
        kycData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return kycData == null
        ? Center()
        : Column(
            children: [
              if (kycData != CircularProgressIndicator())

                ///Contact
                TextSizeBox(),

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
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: Row(
                            children: [
                              // Spacer(),
                              FormTitleText(
                                text: "Contact",
                              ),

                              // Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        PreviewText(
                            nametext: "Primary Mobile Number:",
                            maintext: "${kycData?.whatsappViberNumber}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Secondary Mobile Number:",
                            maintext: "${kycData!.secondaryMobileNumber}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Email Address:",
                            maintext: "${kycData!.emailAddress}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Whatsapp/Viber Number:",
                            maintext: "${kycData!.whatsappViberNumber}"),
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
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        PreviewText(
                            nametext: "Country:",
                            maintext: "${kycData!.currentAddressCountry}"),
                        Spacer(),
                        PreviewText(
                            nametext: "State:",
                            maintext: "${kycData!.currentAddressState}"),
                        Spacer(),
                        PreviewText(
                            nametext: "District:",
                            maintext: "${kycData!.currentAddressDistrict}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Municipality:",
                            maintext: "${kycData!.currentAddressMunicipality}"),
                        Spacer(),
                        PreviewText(
                            nametext: "City/Village/Area:",
                            maintext:
                                "${kycData!.currentAddressCityVillageArea}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Ward No:",
                            maintext: "${kycData!.currentAddressWardNo}"),
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
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: Row(
                            children: [
                              // Spacer(),
                              FormTitleText(
                                text: "Current Address",
                              ),

                              Spacer(),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //         builder: (context) => KycEditFromModel(kycData: kycData!),
                              //       ),
                              //     );
                              //   },
                              //   child: Text("Edit",style: TextStyle(color: primaryColor ),),
                              // ),
                              // Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        PreviewText(
                            nametext: "Country:",
                            maintext: "${kycData!.currentAddressCountry}"),
                        Spacer(),
                        PreviewText(
                            nametext: "State:",
                            maintext: "${kycData!.currentAddressState}"),
                        Spacer(),
                        PreviewText(
                            nametext: "District:",
                            maintext: "${kycData!.currentAddressDistrict}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Municipality:",
                            maintext: "${kycData!.currentAddressMunicipality}"),
                        Spacer(),
                        PreviewText(
                            nametext: "City/Village/Area:",
                            maintext:
                                "${kycData!.currentAddressCityVillageArea}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Ward No:",
                            maintext: "${kycData!.currentAddressWardNo}"),
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
                    padding: const EdgeInsets.only(left: 5, right: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: Row(
                            children: [
                              // Spacer(),
                              FormTitleText(
                                text: "Other",
                              ),
                              Spacer(),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //         builder: (context) => EditKYCPage(kycData: kycData!),
                              //       ),
                              //     );
                              //   },
                              //   child: Text("Edit",style: TextStyle(color: primaryColor ),),
                              // ),
                              // Spacer(),
                            ],
                          ),
                        ),
                        Spacer(),
                        PreviewText(
                            nametext: "Occupation:",
                            maintext: "${kycData!.occupation}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Highest Education:",
                            maintext: "${kycData!.highestEducation}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Hobbies:",
                            maintext: "${kycData!.hobbies}"),
                        Spacer(),
                        PreviewText(
                            nametext: "Expertise:",
                            maintext: "${kycData!.expertise}"),
                        Spacer(),
                        // PreviewText(nametext: "Blood Group:",maintext:"${kycData!.hobbies}"),
                      ],
                    ),
                  )),
              SizedBox(
                height: 50,
              ),

              // if (kycData != CircularProgressIndicator())
              //   Text('No KYC data available'),
            ],
          );
  }
}
