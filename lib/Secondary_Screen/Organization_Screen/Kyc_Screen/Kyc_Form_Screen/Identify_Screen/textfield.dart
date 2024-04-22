import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

enum Gender { Male, Female, Others }

class OrgIdentityTextfiled extends StatefulWidget {
  // const IdentityTextfiled({Key? key}) : super(key: key);

  @override
  State<OrgIdentityTextfiled> createState() => _OrgIdentityTextfiledState();
}

class _OrgIdentityTextfiledState extends State<OrgIdentityTextfiled> {
  final _formKey = GlobalKey<FormState>();
  bool isIdentificationTypeSelected = true;
  bool isOrgTypeSelected = true;

  final email = TextEditingController();
  Gender? _gender;
  bool isgenderselected = false;
  bool _radioSelectedErr = false;

  var gendervalue = 'Choose Gender';
  String identificationType = 'Identification Type';
  String organizationType = "Organization Type";
  final TextEditingController identityNumber = TextEditingController();

  final TextEditingController issuedDate = TextEditingController();
  final TextEditingController issuedFrom = TextEditingController();
  final TextEditingController orgname = TextEditingController();
  final TextEditingController estyear = TextEditingController();
  final TextEditingController regnumber = TextEditingController();
  final TextEditingController grandname = TextEditingController();
  final TextEditingController identitynum = TextEditingController();
  final TextEditingController pannum = TextEditingController();
  final TextEditingController vatnum = TextEditingController();

  bool isppimageerror = false;
  bool isaadharerror = false;
  bool ispanpassporterror = false;
  bool ispanerror = false;
  bool isvotererror = false;
  bool iscitizenshiperror = false;
  bool isbusinesserror = false;
  // image picker
  XFile? citizenshipfront;
  XFile? citizenshipback;
  XFile? aadharcardfront;
  XFile? aadharcardback;
  XFile? passportPanfile;
  XFile? panfile;
  XFile? voterfile;
  late List<String> organizatinoTypeList = [
    'Type of Organization',
    'Bank/Financial institution',
    'Private Ltd',
    // 'Business Registration Certificate',
  ];

  late List<String> identificationTypeList = [
    'Identification Type',
    'Citizenship',
    'Passport',
    'PAN',
    'Voter ID',
    // 'Business Registration Certificate',
  ];
  var gender = ['Choose Gender', 'Male', 'Female', 'Others'];
  _pickaadharfront(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      aadharcardfront = pickedFile!;
    });

    Navigator.pop(context);
  }

  _pickaadharback(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      aadharcardback = pickedFile!;
    });

    Navigator.pop(context);
  }

  _pickupcitizenshipfront(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      citizenshipfront = pickedFile!;
    });

    Navigator.pop(context);
  }

  _pickpassportpan(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      passportPanfile = pickedFile!;
    });

    Navigator.pop(context);
  }

  _pickpan(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      panfile = pickedFile!;
    });

    Navigator.pop(context);
  }

  _pickvote(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      voterfile = pickedFile!;
    });

    Navigator.pop(context);
  }

  _pcikupcitizenshipback(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      citizenshipback = pickedFile!;
    });

    Navigator.pop(context);
  }

  // showing option
  Future<void> _showChoiceDialog(BuildContext context, Function methodname) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      methodname(context, ImageSource.gallery);
                      // _pickimage(context, ImageSource.gallery, value!);
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: primaryColor,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  ListTile(
                    onTap: () {
                      methodname(context, ImageSource.camera);
                    },
                    title: const Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormTitleText(
            text: "Identity",
          ),
          TextSizeBox(),
          // TextFieldText(text: 'Type of Identity',),

          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          //   decoration: customDropDownDecoration(),
          //   height: 50,
          //   child: DropdownButtonHideUnderline(
          //     child: DropdownButton<String>(
          //       value: organizationType,
          //       iconSize: 30,
          //       elevation: 16,
          //       isExpanded: true,
          //       onChanged: (String? newValue) {
          //         if (newValue != null) {
          //           // Update the selected value
          //           setState(() {
          //             organizationType = newValue;
          //           });
          //
          //           // Check if the selected organization type is "Type of Organization"
          //           if (newValue == "Type of Organization") {
          //             setState(() {
          //               isOrgTypeSelected = false; // Set to false if "Type of Organization" is selected
          //             });
          //           } else {
          //             setState(() {
          //               isOrgTypeSelected = true; // Set to true if any other option is selected
          //             });
          //           }
          //         }
          //       },
          //       items: organizatinoTypeList
          //           .map<DropdownMenuItem<String>>((String value) {
          //         return DropdownMenuItem<String>(
          //           value: value,
          //           child: Text(value),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),

          // TextSizeBox(),

          TextFieldText(
            text: 'Organization Name',
          ),
          TextFormField(
              controller: orgname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Organization Name";
                }
                return null;
              },
              decoration: customDecoration(
                "Organization Name",
                "",
              )),
          TextSizeBox(),
          TextFieldText(
            text: 'Establishment Year',
          ),
          TextFormField(
              controller: estyear,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Establishment Year";
                }
                return null;
              },
              decoration: customDecoration(
                "Establishment Year",
                "",
              )),
          TextSizeBox(),
          TextFieldText(
            text: 'Registration Number',
          ),
          TextFormField(
              controller: regnumber,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Registration Number";
                }
                return null;
              },
              decoration: customDecoration(
                "Registration Number",
                "",
              )),
          TextSizeBox(),
          TextFieldText(
            text: 'VAT Number',
          ),
          TextFormField(
              controller: vatnum,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter VAT Number";
                }
                return null;
              },
              decoration: customDecoration(
                "VAT Number",
                "",
              )),
          TextSizeBox(),
          TextFieldText(
            text: 'PAN Number',
          ),
          TextFormField(
              controller: pannum,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter PAN Number";
                }
                return null;
              },
              decoration: customDecoration(
                "PAN Number",
                "",
              )),
          TextSizeBox(),

          Text(
            "Identity Documents",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          TextSizeBox(),

          TextFieldText(
            text: 'Type of Identity',
          ),

          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              decoration: customDropDownDecoration(),
              height: 50,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: identificationType,
                  iconSize: 30,
                  elevation: 16,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    // setState(() {
                    identificationType = newValue!;
                    if (identificationType == "Identification Type") {
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

          TextFieldText(
            text: 'Identity Number',
          ),

          //identification type error message
          Visibility(
            visible: !isIdentificationTypeSelected,
            child: const Text(
              "Choose identification type",
              style: TextStyle(
                  color: errorRed, fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          TextFormField(
              controller: identitynum,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Identity Number";
                }
                return null;
              },
              decoration: customDecoration(
                "Identity Number  ",
                "",
              )),

          if (identificationType != 'Identification Type') ...[
            const SizedBox(
              height: 25,
            ),
            Text(
              'Document ID Proof',
              style: TextStyle(color: nextbuttonColor, fontSize: 16),
            ),
            const Text(
              "Place on a plain dark surface and make sure each corner of your document is visible \nImage should be of size 500px x 500px(less than 5MB)",
              style: TextStyle(
                color: hintgrey,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            identificationType == 'Citizenship'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListTile(
                            title: SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () => _showChoiceDialog(
                                    context, _pickupcitizenshipfront),
                                child: citizenshipfront != null
                                    ? Image.file(File(citizenshipfront!.path))
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_sharp,
                                            size: 70,
                                            color: nextbuttonColor,
                                          ),
                                          // Image.asset(
                                          //   "assets/images/doc_front.png",
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          const Text(
                                            'Citizenship (Front)',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            subtitle: iscitizenshiperror
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Please Upload CitizenShip Front Image',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                      Expanded(
                        child: ListTile(
                            title: SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () => _showChoiceDialog(
                                    context, _pcikupcitizenshipback),
                                child: citizenshipback != null
                                    ? Image.file(File(citizenshipback!.path))
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_outlined,
                                            size: 70,
                                            color: nextbuttonColor,
                                          ),

                                          // Image.asset(
                                          //   "assets/images/doc_back.png",
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          const Text(
                                            'Citizenship (Back)',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            subtitle: iscitizenshiperror
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Please Upload CitizenShip Back Image',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                    ],
                  )
                : SizedBox(),
            identificationType == "Passport"
                ? ListTile(
                    title: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () =>
                            _showChoiceDialog(context, _pickpassportpan),
                        child: passportPanfile != null
                            ? Image.file(File(passportPanfile!.path))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_sharp,
                                    size: 70,
                                    color: nextbuttonColor,
                                  ),
                                  const Text(
                                    "Passport Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    subtitle: ispanpassporterror
                        ? const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Please Upload Passport',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : const SizedBox())
                : const SizedBox(),
            identificationType == "PAN"
                ? ListTile(
                    title: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () => _showChoiceDialog(context, _pickpan),
                        child: panfile != null
                            ? Image.file(File(panfile!.path))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_sharp,
                                    size: 70,
                                    color: nextbuttonColor,
                                  ),
                                  const Text(
                                    "PAN Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    subtitle: ispanerror
                        ? const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Please Upload PAN',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : const SizedBox())
                : const SizedBox(),
            identificationType == 'Aadhar Card'
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListTile(
                            title: Container(
                              // color: Colors.red,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () => _showChoiceDialog(
                                    context, _pickaadharfront),
                                child: aadharcardfront != null
                                    ? Image.file(File(aadharcardfront!.path))
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_sharp,
                                            size: 70,
                                            color: kprimarycolor,
                                          ),

                                          // Center(
                                          //   child: Image.asset(
                                          //     "assets/images/doc_front.png",
                                          //     height: 50,
                                          //     width: 50,
                                          //   ),
                                          // ),
                                          // Text("Aadhar Card (Front)",textAlign: TextAlign.center,)
                                          Text(
                                            'Aadhar Card (Front)',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            subtitle: isaadharerror
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Please Upload  aadharcard Front Image',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                      Expanded(
                        child: ListTile(
                            title: SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: () =>
                                    _showChoiceDialog(context, _pickaadharback),
                                child: aadharcardback != null
                                    ? Image.file(File(aadharcardback!.path))
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.cloud_upload_outlined,
                                            size: 70,
                                            color: kprimarycolor,
                                          ),

                                          // Image.asset(
                                          //   "assets/images/doc_back.png",
                                          //   height: 50,
                                          //   width: 50,
                                          // ),
                                          const Text(
                                            'Aadhar Card (Back)',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            subtitle: iscitizenshiperror
                                ? const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Please Upload Aadhar Card Back Image',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : const SizedBox()),
                      ),
                    ],
                  )
                : const SizedBox(),
            identificationType == "Voter ID"
                ? ListTile(
                    title: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () => _showChoiceDialog(context, _pickvote),
                        child: voterfile != null
                            ? Image.file(File(voterfile!.path))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_upload_sharp,
                                    size: 70,
                                    color: nextbuttonColor,
                                  ),
                                  const Text(
                                    "Voter ID Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    subtitle: isvotererror
                        ? const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Please Upload Voter ID',
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : const SizedBox())
                : const SizedBox(),
          ],
          const SizedBox(
            height: 20,
          ),
          NextButton(
              text: "Next",
              press: () {
                if (_formKey.currentState!.validate()) {
                  Get.to(() => OrgContactScreen(
                          kycModel: OrgKycModel(
                        orgName: orgname.text,
                        estyear: estyear.text,
                        registernuber: regnumber.text,
                        grandfatherName: grandname.text,
                        identityType: identificationType,
                        identityNumber: identitynum.text,
                        pannumber: pannum.text,
                        vatnumber: vatnum.text,
                        aadharcardback:
                            aadharcardback == null ? "" : aadharcardback!.path,
                        aadharcardfront: aadharcardfront == null
                            ? ""
                            : aadharcardfront!.path,
                        citizenshipback: citizenshipback == null
                            ? ""
                            : citizenshipback!.path,
                        citizenshipfront: citizenshipfront == null
                            ? ""
                            : citizenshipfront!.path,
                        panfile: panfile == null ? "" : panfile!.path,
                        passportPanfile: passportPanfile == null
                            ? ""
                            : passportPanfile!.path,
                        voterfile: voterfile == null ? "" : voterfile!.path,
                      )));
                }
              })
        ],
      ),
    );
  }
}
