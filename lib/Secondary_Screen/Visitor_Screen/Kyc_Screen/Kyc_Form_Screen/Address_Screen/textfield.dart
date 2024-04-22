import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';

import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';

import 'package:http/http.dart' as http;
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/address.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/routes.dart';

import '../Other_Screen/body.dart';

class VisitorAddressTextField extends StatefulWidget {
  final KycFromModel kycFromModel;
  VisitorAddressTextField({Key? key, required this.kycFromModel})
      : super(key: key);

  @override
  State<VisitorAddressTextField> createState() =>
      _VisitorAddressTextFieldState();
}

class _VisitorAddressTextFieldState extends State<VisitorAddressTextField> {
  var data;
  DateTime selectedDate = DateTime.now();
  final countryValue = TextEditingController();
  String provinceValue = 'Choose Province';
  String districtValue = "Choose District";
  String municipality = 'Choose Municipality';
  String countryvalue = "Choose Country";
  String selectedState = "Choose State";
  // String statevalue="Choose State";
  // AddressType? _addressType;
  // String countryvalue = 'Nepal';
  final TextEditingController wardNumber = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController municipalityController = TextEditingController();

  bool addresstypeerror = false;
  late List<String> countryName = ["Choose Country", "Nepal", "India"];
  late List<String> provinceName = [provinceValue];
  late List<String> districtName = [districtValue];
  late List<String> municipalityName = [municipality];
  late List<String> stateName = [selectedState];
  final _formKey = GlobalKey<FormState>();
  final selectcolor = Color(0xDD0A66C2).withOpacity(0.2);

  List<String> districtList = [];
  String? selectedProvince, selectedDistrict, selectedMunicipality;
  void getalldata() async {
    try {
      http.Response res = await http.get(Uri.parse(
          "https://raw.githubusercontent.com/sab99r/Indian-States-And-Districts/master/states-and-districts.json"));
      if (res.statusCode == 200) {
        data = jsonDecode(res.body);
        setState(() {});
        // print(data["states"]["state"]);
        for (int i = 0; i < data["states"].length; i++) {
          stateName.add(data["states"][i]["state"]);
          setState(() {});
        }
        for (var state in data['states']) {
          List<String> districts = state['districts'].cast<String>();
          districtList.addAll(districts);
          setState(() {});
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    //for dropdowns
    if (selectedDistrict != null) {
      districtName = [selectedDistrict!];
      districtValue = districtName[0];
      municipalityName = ['Choose Municipality'];
      municipality = municipalityName[0];
    }

    if (selectedMunicipality != null) {
      municipalityName = [selectedMunicipality!];
      municipality = municipalityName[0];
    }
    countryValue.text = "Nepal";
    //for radio

    getalldata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (provinceName.length < 8) {
      provinceName.addAll(Address.province1);
    }
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
                'Next: Address',
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
          TextSizeBox(),
          FormTitleText(
            text: "Permanent Address",
          ),

          ///
          TextSizeBox(),
          TextFieldText(
            text: 'Country',
          ),
          SmallSizedBox(),
          DropdownButtonFormField(
            decoration: dropdownDecoration(
                hintText: 'Country',
                icon: Icon(
                  Icons.flag,
                  color: iconColor,
                )),
            onChanged: (String? newValue) {
              setState(() {
                countryvalue = newValue!;
                if (countryvalue == "Choose Province") {
                  districtName = ['Choose District'];
                  districtValue = districtName[0];
                  municipalityName = ['Choose Municipality'];
                  municipality = municipalityName[0];
                } else if (countryvalue == "Nepal") {
                } else {
                  // districtName.add();
                }
              });
            },
            items:
                countryName.map/*<DropdownMenuItem<String>>*/((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('Select Organization'),
          ),
          countryvalue == "Nepal" || countryvalue == "Choose Country"
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSizeBox(),
                    TextFieldText(
                      text: 'Province /  State',
                    ),
                    SmallSizedBox(),
                    DropdownButtonFormField(
                      decoration: dropdownDecoration(
                          hintText: 'Province',
                          icon: Icon(
                            Icons.location_searching,
                            color: iconColor,
                          )),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProvince = newValue!;
                          if (selectedProvince == "Choose Province") {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                          } else {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                            for (int i = 0;
                                i < Address.district[selectedProvince]!.length;
                                i++) {
                              districtName
                                  .add(Address.district[selectedProvince]![i]);
                            }
                          }
                        });
                      },
                      items: provinceName
                          .map/*<DropdownMenuItem<String>>*/((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Select province / state'),
                    )
                  ],
                )
              : Visibility(visible: false, child: Container()),
          //state
          const SizedBox(
            height: 10,
          ),
          countryvalue == "India" || countryvalue == "Choose Country"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSizeBox(),
                    TextFieldText(
                      text: 'District',
                    ),
                    SmallSizedBox(),
                    DropdownButtonFormField(
                      decoration: dropdownDecoration(
                          hintText: 'Province',
                          icon: Icon(
                            Icons.share_location,
                            color: iconColor,
                          )),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedState = newValue!;
                          if (selectedState == "Choose Province") {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                          } else {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                            for (int i = 0; i < districtList.length; i++) {
                              districtName.add(districtList[i]);
                            }
                          }
                        });
                      },
                      items: stateName
                          .map/*<DropdownMenuItem<String>>*/((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Select province / state'),
                    )
                  ],
                )
              : Container(),

          // district
          TextSizeBox(),
          TextFieldText(
            text: 'District',
          ),
          SmallSizedBox(),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: districtController,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter District" : null,
            decoration: customPrefixDecoration(
                "Enter District",
                "",
                Icon(
                  Icons.location_disabled,
                  color: iconColor,
                )),
          ),

          //municipality
          TextSizeBox(),
          TextFieldText(
            text: 'Municipality / Rural Municipality',
          ),
          SmallSizedBox(),

          TextFormField(
            keyboardType: TextInputType.text,
            controller: municipalityController,
            validator: (value) => value == null || value.isEmpty
                ? "Select municipality / rural municipality"
                : null,
            decoration: customPrefixDecoration(
                "Select municipality / rural municipality",
                "",
                Icon(
                  Icons.location_on_outlined,
                  color: iconColor,
                )),
          ),

          TextSizeBox(),
          TextFieldText(
            text: 'Ward Number',
          ),

          SmallSizedBox(),

          TextFormField(
            keyboardType: TextInputType.number,
            controller: wardNumber,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter Ward Number" : null,
            decoration: customDecoration("Enter Ward Number", ""),
          ),
          TextSizeBox(),
          TextFieldText(
            text: "City/Village/Area",
          ),
          SmallSizedBox(),

          TextFormField(
            controller: address,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter Tole" : null,
            decoration: customDecoration("Enter Tole", ""),
          ),

          TextSizeBox(),
          TextSizeBox(),
          FormTitleText(
            text: "Temporary Address",
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'Country',
          ),
          SmallSizedBox(),
          DropdownButtonFormField(
            decoration: dropdownDecoration(
                hintText: 'Country',
                icon: Icon(
                  Icons.flag,
                  color: iconColor,
                )),
            onChanged: (String? newValue) {
              setState(() {
                countryvalue = newValue!;
                if (countryvalue == "Choose Province") {
                  districtName = ['Choose District'];
                  districtValue = districtName[0];
                  municipalityName = ['Choose Municipality'];
                  municipality = municipalityName[0];
                } else if (countryvalue == "Nepal") {
                } else {
                  // districtName.add();
                }
              });
            },
            items:
                countryName.map/*<DropdownMenuItem<String>>*/((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text('Select Organization'),
          ),
          countryvalue == "Nepal" || countryvalue == "Choose Country"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSizeBox(),
                    TextFieldText(
                      text: 'Province /  State',
                    ),
                    SmallSizedBox(),
                    DropdownButtonFormField(
                      decoration: dropdownDecoration(
                          hintText: 'Province',
                          icon: Icon(
                            Icons.location_searching,
                            color: iconColor,
                          )),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProvince = newValue!;
                          if (selectedProvince == "Choose Province") {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                          } else {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                            for (int i = 0;
                                i < Address.district[selectedProvince]!.length;
                                i++) {
                              districtName
                                  .add(Address.district[selectedProvince]![i]);
                            }
                          }
                        });
                      },
                      items: provinceName
                          .map/*<DropdownMenuItem<String>>*/((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Select province / state'),
                    )
                  ],
                )
              : Container(),

          //state
          const SizedBox(
            height: 10,
          ),
          countryvalue == "India" || countryvalue == "Choose Country"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSizeBox(),
                    TextFieldText(
                      text: 'District',
                    ),
                    SmallSizedBox(),
                    DropdownButtonFormField(
                      decoration: dropdownDecoration(
                          hintText: 'Province',
                          icon: Icon(
                            Icons.share_location,
                            color: iconColor,
                          )),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedState = newValue!;
                          if (selectedState == "Choose Province") {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                          } else {
                            districtName = ['Choose District'];
                            districtValue = districtName[0];
                            municipalityName = ['Choose Municipality'];
                            municipality = municipalityName[0];
                            for (int i = 0; i < districtList.length; i++) {
                              districtName.add(districtList[i]);
                            }
                          }
                        });
                      },
                      items: stateName
                          .map/*<DropdownMenuItem<String>>*/((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text('Select province / state'),
                    )
                  ],
                )
              : Container(),

          // district
          TextSizeBox(),
          TextFieldText(
            text: 'District',
          ),
          SmallSizedBox(),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: districtController,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter District" : null,
            decoration: customPrefixDecoration(
                "Enter District",
                "",
                Icon(
                  Icons.location_disabled,
                  color: iconColor,
                )),
          ),

          //municipality
          TextSizeBox(),
          TextFieldText(
            text: 'Municipality / Rural Municipality',
          ),
          SmallSizedBox(),

          TextFormField(
            keyboardType: TextInputType.text,
            controller: municipalityController,
            validator: (value) => value == null || value.isEmpty
                ? "Select municipality / rural municipality"
                : null,
            decoration: customPrefixDecoration(
                "Select municipality / rural municipality",
                "",
                Icon(
                  Icons.location_on_outlined,
                  color: iconColor,
                )),
          ),

          TextSizeBox(),
          TextFieldText(
            text: 'Ward Number',
          ),
          SmallSizedBox(),

          TextFormField(
            keyboardType: TextInputType.number,
            controller: wardNumber,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter Ward Number" : null,
            decoration: customDecoration("Enter Ward Number", ""),
          ),
          TextSizeBox(),
          TextFieldText(
            text: "City/Village/Area",
          ),
          SmallSizedBox(),
          TextFormField(
            controller: address,
            validator: (value) =>
                value == null || value.isEmpty ? "Enter Tole" : null,
            decoration: customDecoration("Enter Tole", ""),
          ),

          SizedBox(
            height: 40,
          ),
          DefaultButton(
            text: "Continue",
            press: () async {
              // Navigator.pushNamed(context, Routes.otherScreen);

              if (_formKey.currentState!.validate()) {
                Get.to(
                  () => OtherScreen(
                      kycFromModel: KycFromModel(
                          currentAddressCountry: countryvalue,
                          currentAddressState: selectedProvince,
                          currentAddressDistrict: districtController.text,
                          currentAddressMunicipality:
                              municipalityController.text,
                          currentAddressCityVillageArea: address.text,
                          currentAddressWardNo: wardNumber.text,
                          secondaryMobileNumber:
                              widget.kycFromModel.secondaryMobileNumber,
                          emailAddress: widget.kycFromModel.emailAddress,
                          whatsappViberNumber:
                              widget.kycFromModel.whatsappViberNumber,
                          name: widget.kycFromModel.name,
                          citizenshipback: widget.kycFromModel.citizenshipback,
                          citizenshipfront:
                              widget.kycFromModel.citizenshipfront,
                          aadharcardback: widget.kycFromModel.aadharcardback,
                          aadharcardfront: widget.kycFromModel.aadharcardfront,
                          panfile: widget.kycFromModel.panfile,
                          passportPanfile: widget.kycFromModel.passportPanfile,
                          voterfile: widget.kycFromModel.voterfile,
                          fatherName: widget.kycFromModel.fatherName,
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
          // Row(
          //   children: [
          //     Spacer(),
          //     BackButtons(
          //       text: "Back",
          //       press: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //     Spacer(),
          //     Spacer(),
          //     Spacer(),
          //     NextButton(
          //       text: "Next",
          //       press: () async {
          //         // Navigator.pushNamed(context, Routes.otherScreen);
          //
          //         if (_formKey.currentState!.validate()) {
          //           Get.to(() => OtherScreen(
          //               kycFromModel: KycFromModel(
          //                   currentAddressCountry: countryvalue,
          //                   currentAddressState: selectedProvince,
          //                   currentAddressDistrict: districtController.text,
          //                   currentAddressMunicipality:
          //                       municipalityController.text,
          //                   currentAddressCityVillageArea: address.text,
          //                   currentAddressWardNo: wardNumber.text,
          //                   secondaryMobileNumber:
          //                       widget.kycFromModel.secondaryMobileNumber,
          //                   emailAddress: widget.kycFromModel.emailAddress,
          //                   whatsappViberNumber:
          //                       widget.kycFromModel.whatsappViberNumber,
          //                   name: widget.kycFromModel.name,
          //                   citizenshipback:
          //                       widget.kycFromModel.citizenshipback,
          //                   citizenshipfront:
          //                       widget.kycFromModel.citizenshipfront,
          //                   aadharcardback: widget.kycFromModel.aadharcardback,
          //                   aadharcardfront:
          //                       widget.kycFromModel.aadharcardfront,
          //                   panfile: widget.kycFromModel.panfile,
          //                   passportPanfile:
          //                       widget.kycFromModel.passportPanfile,
          //                   voterfile: widget.kycFromModel.voterfile,
          //                   fatherName: widget.kycFromModel.fatherName,
          //                   motherName: widget.kycFromModel.motherName,
          //                   grandfatherName:
          //                       widget.kycFromModel.grandfatherName,
          //                   gender: widget.kycFromModel.gender,
          //                   nationality: widget.kycFromModel.nationality,
          //                   maritalStatus: widget.kycFromModel.maritalStatus,
          //                   identityNumber: widget.kycFromModel.identityNumber,
          //                   identityType: widget.kycFromModel.identityType)),
          //           );
          //         }
          //       },
          //     ),
          //     Spacer(),
          //   ],
          // )
        ],
      ),
    );
  }
}
