import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Model/model.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

import '../../../Kyc_Preview_Screen/Service/kycService.dart';
import '../Contact_Screen/body.dart';
enum Gender { Male, Female, Others }
enum Nationality{ Nepal, Other}
enum Marital{ Married, Unmarried}

class EditIdentityTextfiled extends StatefulWidget {
  final KYCDataModel kycEditData;

  EditIdentityTextfiled ({required this.kycEditData});

  @override
  State<EditIdentityTextfiled> createState() => _EditIdentityTextfiledState();
}

class _EditIdentityTextfiledState extends State<EditIdentityTextfiled> {
  final _formKey = GlobalKey<FormState>();
  bool isIdentificationTypeSelected = true;


  Gender? _selectedgender;
  bool isgenderselected = false;
  bool _radioSelectedErr = false;

  Nationality? _selectedNationali;
  bool isnationality= false;

  Marital? _selectedMarital;
  bool ismaritualselected = false;



  late TextEditingController nameController;
  late TextEditingController fatherNameController;
  late TextEditingController identityNumberController;
  // Add more controllers for other fields

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with the KYC data
    nameController = TextEditingController(text: widget.kycEditData.name);
    fatherNameController = TextEditingController(text: widget.kycEditData.fatherName);
    identityNumberController =TextEditingController(text: widget.kycEditData.identityNumber);
    firstname.text=widget.kycEditData.name!;
    fathername.text=widget.kycEditData.fatherName!;
    mothername.text=widget.kycEditData.motherName!;
    grandfathername.text=widget.kycEditData.grandfatherName!;
    gendervalue=widget.kycEditData.gender!;
    identificationType=widget.kycEditData.identityType!;
    print(widget.kycEditData.identityDocumentsFront);
        print(widget.kycEditData.identityDocumentsBack);

    if(widget.kycEditData.maritalStatus=="Married"){
      _selectedMarital=Marital.Married;
    }else{
      _selectedMarital=Marital.Unmarried;
    }
     if(widget.kycEditData.nationality=="Nepal"){
      _selectedNationali=Nationality.Nepal;
    }else{
      _selectedNationali=Nationality.Other;
    }
     if(widget.kycEditData.gender=="Male"){
      _selectedgender=Gender.Male;
    }  else  if(widget.kycEditData.gender=="Female"){
      _selectedgender=Gender.Female;
    }
    else{
      _selectedgender=Gender.Others;
    }
    documentproofinital();
    setState(() {
      
    });
    print(widget.kycEditData.fatherName);
  }
  var gendervalue = 'Choose Gender';
  String identificationType = 'Identification Type';

  final  TextEditingController firstname = TextEditingController();
  final  TextEditingController fathername =TextEditingController();
  final  TextEditingController mothername =TextEditingController();
  final  TextEditingController grandfathername=TextEditingController();

  // final TextEditingController identityNumber = TextEditingController();
  // final  TextEditingController firstname = TextEditingController();
  // final  TextEditingController fathername =TextEditingController();
  // final  TextEditingController mothername =TextEditingController();
  // final  TextEditingController grandfathername=TextEditingController();

void documentproofinital(){
  if(widget.kycEditData.identityType=="Passport"){
    passportPanfile=widget.kycEditData.identityDocumentsFront;
  }else if(widget.kycEditData.identityType=="Citizenship"){
citizenshipfront=widget.kycEditData.identityDocumentsFront;
citizenshipback=widget.kycEditData.identityDocumentsBack;
  }else if(widget.kycEditData.identityType=="PAN"){
    panfile=widget.kycEditData.identityDocumentsFront;
  }else if(widget.kycEditData.identityType=="Voter ID"){
    voterfile=widget.kycEditData.identityDocumentsFront;
  }
}
  bool isppimageerror = false;
  bool isaadharerror= false;
  bool ispanpassporterror = false;
  bool ispanerror = false;
  bool isvotererror =false;
  bool iscitizenshiperror = false;
  bool isbusinesserror=false;
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
  var gender = ['Choose Gender', 'Male', 'Female', 'Others'];
  _pickaadharfront(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      aadharcardfront = pickedFile! ;
    });

    Navigator.pop(context);
  }
  _pickaadharback(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      aadharcardback= pickedFile!;
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
          FormTitleText(text: "Identifty",),
          TextSizeBox(),
          TextFieldText(text: 'Full Name',),
          TextFormField(
              controller:  firstname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Full Name";
                }
                return null;
              },
              decoration:customDecoration("Full Name", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Father Name',),
          TextFormField(
              controller: fathername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Father Name";
                }
                return null;
              },
              decoration:customDecoration("Father Name", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Mother Name',),
          TextFormField(
              controller: mothername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mother Name";
                }
                return null;
              },
              decoration:customDecoration("Mother Name", "",)),
          TextSizeBox(),
          TextFieldText(text: 'Grandfather Name',),
          TextFormField(
              controller: grandfathername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Grandfather Name";
                }
                return null;
              },
              decoration:customDecoration("Grandfather Name", "",)),



          ///Radio Button Start
          TextSizeBox(),
          TextFieldText(text: 'Marital Status',),
          Row(
            children: <Widget>[
              Radio<Marital>(
                value: Marital.Married,
                groupValue: _selectedMarital,
                onChanged: (Marital? value) {
                  setState(() {
                    _selectedMarital = value!;
                    ismaritualselected= true;
                    print(_selectedMarital);
                  });
                },
                activeColor: nextbuttonColor,
                fillColor: MaterialStateColor.resolveWith(
                        (states) => nextbuttonColor),
              ),
              Text(
                'Married',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: nextbuttonColor
                ),
              ),
              Radio<Marital>(
                value: Marital.Unmarried,
                groupValue: _selectedMarital,
                onChanged: (Marital? value) {
                  setState(() {
                    _selectedMarital = value!;
                    ismaritualselected= true;
                  });
                },
                activeColor: nextbuttonColor,
                fillColor: MaterialStateColor.resolveWith(
                        (states) => nextbuttonColor),
              ),
              Text(
                'Unmarried',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: nextbuttonColor
                ),
              ),

            ],
          ),
          TextFieldText(text: 'Gender',),
          Row(
            children: <Widget>[
              Radio<Gender>(
                value: Gender.Male,
                groupValue:_selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender = value;
                    isgenderselected = true;
                  });
                },
                activeColor: nextbuttonColor,
                fillColor: MaterialStateColor.resolveWith(
                      (states) =>nextbuttonColor,
                ),
              ),
              Text(
                'Male',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: nextbuttonColor
                ),
              ),
              Radio<Gender>(
                value: Gender.Female,
                groupValue:_selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender = value!;
                    isgenderselected = true;
                  });
                },
                activeColor: primaryColor,
                fillColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor),
              ),
              Text(
                'Female',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: nextbuttonColor
                ),
              ),
              Radio<Gender>(
                value: Gender.Others,
                groupValue: _selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender= value!;
                    isgenderselected = true;
                  });
                },
                activeColor: primaryColor,
                fillColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor),
              ),
              Text(
                'Other',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: nextbuttonColor
                ),
              ),
            ],
          ),
          TextFieldText(text: 'Nationality',),
          Row(
            children: <Widget>[
              Radio<Nationality>(
                value: Nationality.Nepal,
                groupValue: _selectedNationali,
                onChanged: (Nationality? value) {
                  setState(() {
                    _selectedNationali = value!;
                    isgenderselected = true;
                  });
                },
                activeColor: primaryColor,
                fillColor: MaterialStateColor.resolveWith(
                        (states) =>  nextbuttonColor),
              ),
              Text(
                'Nepali',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color:  nextbuttonColor,
                ),
              ),
              Radio<Nationality>(
                value: Nationality.Other,
                groupValue: _selectedNationali,
                onChanged: (Nationality? value) {
                  setState(() {
                    _selectedNationali = value!;
                    isgenderselected = true;
                  });
                },
                activeColor: primaryColor,
                fillColor: MaterialStateColor.resolveWith(
                        (states) =>  nextbuttonColor),
              ),

              Text(
                'Other',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color:  nextbuttonColor,

                ),
              ),
            ],
          ),
          _radioSelectedErr ?  const Text('Please selected !!',
              style: TextStyle(color: Colors.red)) : SizedBox(),
          ///Radio Button End



          Text("Identity Documents",style: TextStyle(fontWeight: FontWeight.w900 ),),
          TextSizeBox(),

          TextFieldText(text: 'Type of Identity',),

          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0, vertical: 5.0),
              decoration:customDropDownDecoration(),
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

          TextFieldText(text: 'Identity Number',),


          //identification type error message
          Visibility(
            visible: !isIdentificationTypeSelected,
            child: const Text(
              "Choose identification type",
              style: TextStyle(
                  color: errorRed,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          TextFormField(
              controller: identityNumberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Identity Number";
                }
                return null;
              },
              decoration:customDecoration("Identity Number  ", "",)),



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
                              ? Image.file(
                              File(citizenshipfront!.path))
                              : Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_sharp,size: 70,color: nextbuttonColor,),
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
                                    fontWeight:
                                    FontWeight.bold),
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
                              ? Image.file(
                              File(citizenshipback!.path))
                              : Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_outlined,size: 70,color: nextbuttonColor,),

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
                                    fontWeight:
                                    FontWeight.bold),
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
                :SizedBox(),
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
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_sharp,size: 70,color: nextbuttonColor,),

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
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_sharp,size: 70,color: nextbuttonColor,),

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
                              ? Image.file(
                              File( aadharcardfront!.path))
                              : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_sharp,size: 70,color: kprimarycolor,),

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
                                    fontWeight:
                                    FontWeight.bold),
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
                          onTap: () => _showChoiceDialog(
                              context, _pickaadharback),
                          child: aadharcardback != null
                              ? Image.file(
                              File(aadharcardback!.path))
                              : Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_outlined,size: 70,color: kprimarycolor,),

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
                                    fontWeight:
                                    FontWeight.bold),
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
                    child:   voterfile  != null
                        ? Image.file(File(   voterfile !.path))
                        : Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_sharp,size: 70,color: nextbuttonColor,),

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
            press: () async {
              if (_formKey.currentState!.validate()) {
                if (_selectedgender == null) {
                  setState(() {
                    _radioSelectedErr = true;
                  });
                } else {
                  setState(() {
                    _radioSelectedErr = false;
                  });
                  Get.to(()=>EditContactScreen(
                      kycFromModel: KycFromModel(
                    name: firstname.text,
                    bloodGroup: widget.kycEditData.blood_group,
                    fatherName: fathername.text,
                    emailAddress: widget.kycEditData.emailAddress,
                    secondaryMobileNumber: widget.kycEditData.secondaryMobileNumber,
                    whatsappViberNumber: widget.kycEditData.whatsappViberNumber,
                    motherName: mothername.text,
                    currentAddressCountry: widget.kycEditData.currentAddressCountry,
                    currentAddressState: widget.kycEditData.currentAddressState,
                    currentAddressCityVillageArea: widget.kycEditData.currentAddressCityVillageArea,
                    currentAddressDistrict: widget.kycEditData.currentAddressDistrict,
                    currentAddressMunicipality: widget.kycEditData.currentAddressMunicipality,
                    currentAddressWardNo: widget.kycEditData.currentAddressWardNo,
                    expertise: widget.kycEditData.expertise,
                    occupation: widget.kycEditData.occupation,
                    highestEducation: widget.kycEditData.highestEducation,
                    hobbies: widget.kycEditData.hobbies,
                    
                    grandfatherName: grandfathername.text,
                    aadharcardback: aadharcardback==null?"":aadharcardback!.path,
                    aadharcardfront: aadharcardfront==null?"":aadharcardfront!.path,
                    citizenshipback: citizenshipback==null?"":citizenshipback!.path,
                    citizenshipfront: citizenshipfront==null?"":citizenshipfront!.path,
                    panfile: panfile==null?"":panfile!.path,
                    passportPanfile: passportPanfile==null?"":passportPanfile!.path,
                    voterfile: voterfile==null?"":voterfile!.path,
                    gender: _selectedgender!.toString().split('.')[1],
                    nationality:_selectedNationali!.toString().split('.')[1],
                    maritalStatus: _selectedMarital!.toString().split('.')[1],
                    identityNumber: identityNumberController.text,
                    identityType: identificationType,

                  ))
                  );
                }
              }
            },
          )

        ],
      ),
    );
  }
}



