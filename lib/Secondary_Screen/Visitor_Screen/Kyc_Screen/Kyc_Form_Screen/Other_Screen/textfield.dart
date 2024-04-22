import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Preview_kyc_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/LoginDetailsService.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

import '../Models/kyc_from_model.dart';

class OtherTextfiled extends StatefulWidget {
  final KycFromModel kycFromModel;
  OtherTextfiled({Key? key, required this.kycFromModel}) : super(key: key);

  @override
  State<OtherTextfiled> createState() => _OtherTextfiledState();
}

class _OtherTextfiledState extends State<OtherTextfiled> {
  final _formKey = GlobalKey<FormState>();
  bool isIdentificationTypeSelected = true;

  final TextEditingController occupation = TextEditingController();
  final TextEditingController highestEdu = TextEditingController();
  final TextEditingController hobbies = TextEditingController();
  final TextEditingController expertise = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController identityNumber = TextEditingController();

  String identificationType = 'Identification Type';

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

  late List<String> identificationTypeList = [
    'Identification Type',
    'Citizenship',
    'Passport',
    'PAN',
    'Voter ID',
    // 'Business Registration Certificate',
  ];
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

  DateTime datetime = DateTime.now();
  final englishdateofbirth = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  final dateofbirth = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(NepaliDateTime.now()));

  selectEnglishDate(BuildContext context) async {
    DateTime? _selectDate = await showDatePicker(
        context: context,
        initialDate: datetime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));
    if (_selectDate != null && _selectDate != datetime) {
      setState(() {
        englishdateofbirth.text = DateFormat('yyyy-MM-dd').format(_selectDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '03/',
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
                'Complete',
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
            text: "ID Verification",
          ),

          ///Radio Button End
          TextSizeBox(),
          TextFieldText(
            text: 'ID Type',
          ),
          SmallSizedBox(),

          DropdownButtonFormField(
            decoration: dropdownDecoration(
                hintText: '',
                icon: Icon(
                  Icons.quick_contacts_mail_rounded,
                  color: iconColor,
                )),
            onChanged: (String? newValue) {
              identificationType = newValue!;
              if (identificationType == "Identification Type") {
              } else {
                setState(() {
                  isIdentificationTypeSelected = true;
                });
              }
            },
            items: identificationTypeList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('Select Organization'),
          ),

          TextSizeBox(),
          TextFieldText(
            text: 'Identity Number',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: identityNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Identity Number";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Identity Number  ",
                  "",
                  Icon(
                    Icons.quick_contacts_mail_rounded,
                    color: iconColor,
                  ))),

          TextSizeBox(),
          TextFieldText(
            text: 'Date of Birth',
          ),
          SmallSizedBox(),
          TextFormField(
            readOnly: true,
            enableInteractiveSelection: false,
            controller: englishdateofbirth,
            onChanged: (value) {
              setState(() {
                englishdateofbirth.text = "${englishdateofbirth}".split(' ')[0];
              });
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                  selectEnglishDate(context);
                },
                icon: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.grey,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              fillColor: Colors.white,
              filled: true,
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: boarderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: boarderColor,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
              hoverColor: primaryColor,
            ),
          ),
          TextSizeBox(),
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
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your front side document"),
                      SizedBox(
                        height: 10,
                      ),
                      DottedBorder(
                        color: Color(0xFFA2A2A2), // Set the border color
                        strokeWidth: 2, // Set the border width
                        borderType:
                            BorderType.RRect, // Use RRect for rounded corners
                        radius: Radius.circular(
                            10), // Set the border radius if needed
                        child: InkWell(
                          onTap: () => _showChoiceDialog(
                              context, _pickupcitizenshipfront),
                          child: Container(
                            width: 382,
                            height: 140,
                            child: citizenshipfront != null
                                ? Image.file(File(citizenshipfront!.path))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.upload,
                                        color: iconColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Browse a file',
                                        style: TextStyle(
                                          color: Color(0xFF0F75BC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Your back side document"),
                      SizedBox(
                        height: 10,
                      ),
                      DottedBorder(
                        color: Color(0xFFA2A2A2), // Set the border color
                        strokeWidth: 2, // Set the border width
                        borderType:
                            BorderType.RRect, // Use RRect for rounded corners
                        radius: Radius.circular(
                            10), // Set the border radius if needed
                        child: InkWell(
                          onTap: () => _showChoiceDialog(
                              context, _pcikupcitizenshipback),
                          child: Container(
                            width: 382,
                            height: 140,
                            child: citizenshipback != null
                                ? Image.file(File(citizenshipback!.path))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.upload,
                                        color: iconColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Browse a file',
                                        style: TextStyle(
                                          color: Color(0xFF0F75BC),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            identificationType == "Passport"
                ? ListTile(
                    title: SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () =>
                            _showChoiceDialog(context, _pickpassportpan),
                        child: passportPanfile != null
                            ? Image.file(File(passportPanfile!.path))
                            : DottedBorder(
                                color:
                                    Color(0xFFA2A2A2), // Set the border color
                                strokeWidth: 2, // Set the border width
                                borderType: BorderType
                                    .RRect, // Use RRect for rounded corners
                                radius: Radius.circular(
                                    10), // Set the border radius if needed
                                child: Container(
                                  width: 382,
                                  height: 140,
                                  child: passportPanfile != null
                                      ? Image.file(File(passportPanfile!.path))
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.upload,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Browse a file',
                                              style: TextStyle(
                                                color: Color(0xFF0F75BC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
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
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () => _showChoiceDialog(context, _pickpan),
                        child: panfile != null
                            ? Image.file(File(panfile!.path))
                            : DottedBorder(
                                color:
                                    Color(0xFFA2A2A2), // Set the border color
                                strokeWidth: 2, // Set the border width
                                borderType: BorderType
                                    .RRect, // Use RRect for rounded corners
                                radius: Radius.circular(
                                    10), // Set the border radius if needed
                                child: Container(
                                  width: 382,
                                  height: 140,
                                  child: panfile != null
                                      ? Image.file(File(panfile!.path))
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.upload,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Browse a file',
                                              style: TextStyle(
                                                color: Color(0xFF0F75BC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
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
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () => _showChoiceDialog(context, _pickvote),
                        child: voterfile != null
                            ? Image.file(File(voterfile!.path))
                            : DottedBorder(
                                color:
                                    Color(0xFFA2A2A2), // Set the border color
                                strokeWidth: 2, // Set the border width
                                borderType: BorderType
                                    .RRect, // Use RRect for rounded corners
                                radius: Radius.circular(
                                    10), // Set the border radius if needed
                                child: Container(
                                  width: 382,
                                  height: 140,
                                  child: voterfile != null
                                      ? Image.file(File(voterfile!.path))
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.upload,
                                              color: iconColor,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Browse a file',
                                              style: TextStyle(
                                                color: Color(0xFF0F75BC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
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
          SizedBox(
            height: 40,
          ),
          DefaultButton(
            text: "Continue",
            press: () async {
              // Navigator.pushNamed(context, Routes.previewScreen);

              if (_formKey.currentState!.validate()) {
                Get.to(
                  () => PreviewScreen(
                      kycFromModel: KycFromModel(
                          occupation: occupation.text,
                          highestEducation: "educationType",
                          hobbies: hobbies.text,
                          expertise: expertise.text,
                          bloodGroup: bloodGroup.text,
                          currentAddressCountry:
                              widget.kycFromModel.currentAddressCountry,
                          currentAddressState:
                              widget.kycFromModel.currentAddressState,
                          currentAddressDistrict:
                              widget.kycFromModel.currentAddressDistrict,
                          currentAddressMunicipality:
                              widget.kycFromModel.currentAddressMunicipality,
                          currentAddressCityVillageArea:
                              widget.kycFromModel.currentAddressCityVillageArea,
                          currentAddressWardNo:
                              widget.kycFromModel.currentAddressWardNo,
                          secondaryMobileNumber:
                              widget.kycFromModel.secondaryMobileNumber,
                          emailAddress: widget.kycFromModel.emailAddress,
                          whatsappViberNumber:
                              widget.kycFromModel.whatsappViberNumber,
                          name: widget.kycFromModel.name,
                          fatherName: widget.kycFromModel.fatherName,
                          citizenshipback: widget.kycFromModel.citizenshipback,
                          citizenshipfront:
                              widget.kycFromModel.citizenshipfront,
                          aadharcardback: widget.kycFromModel.aadharcardback,
                          aadharcardfront: widget.kycFromModel.aadharcardfront,
                          panfile: widget.kycFromModel.panfile,
                          passportPanfile: widget.kycFromModel.passportPanfile,
                          voterfile: widget.kycFromModel.voterfile,
                          motherName: widget.kycFromModel.motherName,
                          grandfatherName: widget.kycFromModel.grandfatherName,
                          gender: widget.kycFromModel.gender,
                          nationality: widget.kycFromModel.nationality,
                          maritalStatus: widget.kycFromModel.maritalStatus,
                          identityNumber: widget.kycFromModel.identityNumber,
                          identityType: widget.kycFromModel.identityType)),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
