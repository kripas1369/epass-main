import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Preview_kyc_Screen/widgets/containerDecoration.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/Model/manual_model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/Widgets/button.dart';
import '../../../../../Widgets/text.dart';
import '../Manual_Entry_Sceen/Service/manual_Service.dart';

class ManualPreviewScreen extends StatefulWidget {
  final ManuallyFormModel manual;

  ManualPreviewScreen(
      {Key? key, required this.manual, })
      : super(key: key);

  @override
  State<ManualPreviewScreen> createState() => _ManualPreviewScreenState();
}

class _ManualPreviewScreenState extends State<ManualPreviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(scaffoldKey: _scaffoldKey, title: 'Manual Entry', textcolor: Colors.black,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
                      width: 500,
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
                            initiallyExpanded: true,

                            title: Text(
                              "",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            leading: SizedBox(width: 0,),
                            iconColor: Colors.black,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start, // Align children text to start
                                children: [
                                  PreviewPageText(nametext: "Organization", maintext: "${widget.manual.organization}", icon: Icons.business_rounded,),
                                  PreviewPageText(nametext: "Full Name", maintext: "${widget.manual.fullname}", icon: Icons.perm_identity,),
                                  PreviewPageText(nametext: "Full Address", maintext: "${widget.manual.address}", icon: Icons.location_on_outlined,),
                                  PreviewPageText(nametext: "Mobile Number", maintext: "${widget.manual.mobilenumber}",icon: Icons.phone_android_rounded),
                                  PreviewPageText(nametext: "Email Address", maintext: "${widget.manual.email}",icon: Icons.email_outlined),
                                  PreviewPageText(nametext: "Number of Visitors", maintext: "${widget.manual.numberofVisitor}",icon: Icons.people_alt_outlined),
                                  PreviewPageText(nametext: "Type of ID", maintext: "${widget.manual.identification_type}",icon: Icons.medical_information_outlined),
                                  PreviewPageText(nametext: "ID Number", maintext: "${widget.manual.identification_number}",icon: Icons.medical_information_outlined),
                                  PreviewPageText(nametext: "Have Vehicle", maintext: "${widget.manual.havevehicle}", icon: Icons.directions_bike_rounded),
                                  Visibility(
                                    visible: widget.manual.havevehicle == "Yes" ? true : false,
                                    child: PreviewPageText(
                                        nametext: "Vehicle Number",
                                        maintext: widget.manual.vehiclenumber,
                                        icon: Icons.directions_bike_rounded
                                    ),
                                  ),
                                  PreviewPageText(nametext: "Purpose", maintext: "${widget.manual.purpose}", icon: Icons.messenger_outline,),

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

              SizedBox(height: 10),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                text: "Submit",
                press: () async {
                  QrManualService().postManual(
                      context: context,
                      mobilenumber: widget.manual.mobilenumber,
                    email: widget.manual.email,
                    name: widget.manual.fullname,
                    numberofvisitor: widget.manual.numberofVisitor,
                    purpose: widget.manual.purpose,
                    remark: widget.manual.remark,
                    visitingform: widget.manual.visiting_from,
                    vehiclenumber: widget.manual.vehiclenumber,
                    orgid: widget.manual.orgid?.toString() ?? 'N/A',
                    idnumber:widget.manual.identification_number,
                    idtype:widget.manual.identification_type,
                    address: widget.manual.address,
                    havevehicle:widget.manual.havevehicle,

                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
