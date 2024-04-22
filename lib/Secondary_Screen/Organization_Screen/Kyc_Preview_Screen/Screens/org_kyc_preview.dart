import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Preview_Screen/Model/org_kyc_preview_model.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Preview_Screen/Service/org_kyc_preview_service.dart';
import 'package:pass/Widgets/text.dart';

import '../../../../Widgets/sizebox.dart';
import '../../Kyc_Screen/Preview_kyc_Screen/widgets/containerDecoration.dart';

class OrgKycPreviewBody extends StatefulWidget {
  const OrgKycPreviewBody({super.key});

  @override
  State<OrgKycPreviewBody> createState() => _OrgKycPreviewBodyState();
}

class _OrgKycPreviewBodyState extends State<OrgKycPreviewBody> {
  OrgKycPreviewModel? orgKycPreviewModel;
  void getpreview() async {
    orgKycPreviewModel = await OrgKycPreviewService().getorgkyc();
    setState(() {});
  }

  @override
  void initState() {
    getpreview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: orgKycPreviewModel == null
          ? Center()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextSizeBox(),
                  Container(
                      height: 250,
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
                                nametext: "Organization ID",
                                maintext: orgKycPreviewModel!.id.toString()),
                            Spacer(),
                            PreviewText(
                                nametext: "Establishment Year",
                                maintext: orgKycPreviewModel!.establishmentYear
                                    .toString()),
                            Spacer(),
                            PreviewText(
                                nametext: "Registration Number",
                                maintext:
                                    orgKycPreviewModel!.registrationNumber!),
                            // Spacer(),
                            // PreviewText(nametext: "Grandfather Name:", maintext:orgKycModel.grandfatherName!),

                            // Spacer(),
                            // PreviewText(nametext: "Identity Type:", maintext:"Kripas Khatiwada"),
                            Spacer(),
                            PreviewText(
                                nametext: "Organization Summary",
                                maintext:
                                    orgKycPreviewModel!.organizationSummary!),
                            Spacer(),
                            PreviewText(
                                nametext: "PAN Number:",
                                maintext: orgKycPreviewModel!.panNumber!),
                            Spacer(),
                            PreviewText(
                                nametext: "VAT Number:",
                                maintext: orgKycPreviewModel!.vatNumber!),
                            Spacer(),

                            Spacer(),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
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
                              padding:
                                  const EdgeInsets.only(left: 0, right: 10),
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
                                maintext:
                                    "${orgKycPreviewModel!.telephoneNumber}"),
                            Spacer(),
                            PreviewText(
                                nametext: "Secondary Mobile Number:",
                                maintext: orgKycPreviewModel!.secondaryNumber),
                            Spacer(),
                            PreviewText(
                                nametext: "Whatsapp/Viber Number:",
                                maintext:
                                    orgKycPreviewModel!.whatsappViberNumber),
                            Spacer(),
                            PreviewText(
                                nametext: "Website:",
                                maintext: orgKycPreviewModel!.website!),
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
                                maintext: orgKycPreviewModel!.country),
                            Spacer(),
                            PreviewText(
                                nametext: "State:",
                                maintext: orgKycPreviewModel!.state),
                            Spacer(),
                            PreviewText(
                                nametext: "District:",
                                maintext: orgKycPreviewModel!.district),
                            Spacer(),
                            PreviewText(
                                nametext: "Municipality:",
                                maintext: orgKycPreviewModel!.municipality),
                            Spacer(),
                            PreviewText(
                                nametext: "City/Village/Area:",
                                maintext: orgKycPreviewModel!.cityVillageArea),
                            Spacer(),
                            PreviewText(
                                nametext: "Ward No:",
                                maintext: orgKycPreviewModel!.wardNo),
                            Spacer(),
                          ],
                        ),
                      )),

                  // ///Current Address
                  // TextSizeBox(),
                  // TextSizeBox(),
                  // Container(
                  //     height: 160,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: previewBoxDecoration(),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 5, right: 5),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Spacer(),
                  //           Padding(
                  //             padding: const EdgeInsets.only(left: 0, right: 10),
                  //             child: Row(
                  //               children: [
                  //                 // Spacer(),
                  //                 FormTitleText(
                  //                   text: "Current Address",
                  //                 ),

                  //                 Spacer(),
                  //                 // InkWell(
                  //                 //   onTap: () {
                  //                 //     Navigator.of(context).push(
                  //                 //       MaterialPageRoute(
                  //                 //         builder: (context) => KycEditFromModel(kycData: kycData!),
                  //                 //       ),
                  //                 //     );
                  //                 //   },
                  //                 //   child: Text("Edit",style: TextStyle(color: primaryColor ),),
                  //                 // ),
                  //                 // Spacer(),
                  //               ],
                  //             ),
                  //           ),
                  //           Spacer(),
                  //           PreviewText(
                  //               nametext: "Country:",
                  //               maintext: "${kycData!.currentAddressCountry}"),
                  //           Spacer(),
                  //           PreviewText(
                  //               nametext: "State:",
                  //               maintext: "${kycData!.currentAddressState}"),
                  //           Spacer(),
                  //           PreviewText(
                  //               nametext: "District:",
                  //               maintext: "${kycData!.currentAddressDistrict}"),
                  //           Spacer(),
                  //           PreviewText(
                  //               nametext: "Municipality:",
                  //               maintext: "${kycData!.currentAddressMunicipality}"),
                  //           Spacer(),
                  //           PreviewText(
                  //               nametext: "City/Village/Area:",
                  //               maintext:
                  //                   "${kycData!.currentAddressCityVillageArea}"),
                  //           Spacer(),
                  //           PreviewText(
                  //               nametext: "Ward No:",
                  //               maintext: "${kycData!.currentAddressWardNo}"),
                  //           Spacer(),
                  //         ],
                  //       ),
                  //     )),
                ],
              ),
            ),
    );
  }
}
