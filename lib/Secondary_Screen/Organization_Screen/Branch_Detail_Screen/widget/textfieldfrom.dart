import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branch_Detail_Screen/service/branch_service.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/textfield.dart';

import '../../../../Widgets/sizebox.dart';
import '../../../../Widgets/text.dart';
import 'package:http/http.dart' as http;
import '../../../Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/address.dart';

class TextFieldFromBranch extends StatefulWidget {
  const TextFieldFromBranch({super.key});

  @override
  State<TextFieldFromBranch> createState() => _TextFieldFromBranchState();
}

class _TextFieldFromBranchState extends State<TextFieldFromBranch> {
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
  final wardNumber = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final districtController = TextEditingController();
  final municipalityController = TextEditingController();
  final branchnamecontroller = TextEditingController();
  final branchnumbercontroller = TextEditingController();

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

        // print(district);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSizeBox(),
        TextFieldText(
          text: 'Branch Name',
        ),
        TextFormField(
            controller: branchnamecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Branch Name";
              }
              return null;
            },
            decoration: customDecoration(
              "Branch  Name",
              "",
            )),
        TextSizeBox(),
        TextFieldText(
          text: 'Branch Number',
        ),
        TextFormField(
            controller: branchnumbercontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Branch Number";
              }
              return null;
            },
            decoration: customDecoration(
              "Branch  Number",
              "",
            )),

        TextSizeBox(),
        TextFieldText(
          text: 'Country',
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          decoration: customDropDownDecoration(),
          height: 50,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: countryvalue,
              iconSize: 30,
              elevation: 16,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  countryvalue = newValue!;
                  if (countryvalue == "Choose Province") {
                    districtName = ['Choose District'];
                    districtValue = districtName[0];
                    municipalityName = ['Choose Municipality'];
                    municipality = municipalityName[0];
                  } else if (countryvalue == "Nepal") {
                    // districtName = ['Choose District'];
                    // districtValue = districtName[0];
                    // municipalityName = ['Choose Municipality'];
                    // municipality = municipalityName[0];
                    // for (int i = 0;
                    //     i <
                    //         Address
                    //             .district[selectedProvince]!.length;
                    //     i++) {
                    //   districtName.add(
                    //       Address.district[selectedProvince]![i]);
                    // }
                  } else {
                    // districtName.add();
                  }
                });
              },
              // validator: (value) => value == 'Choose Province'
              //     ? "Choose Province"
              //     : null,
              items:
                  countryName.map/*<DropdownMenuItem<String>>*/((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        //province
        TextSizeBox(),
        countryvalue == "Nepal" || countryvalue == "Choose Country"
            ? TextFieldText(
                text: 'Province',
              )
            : Container(),

        countryvalue == "Nepal" || countryvalue == "Choose Country"
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: customDropDownDecoration(),
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedProvince ?? provinceValue,
                    iconSize: 30,
                    elevation: 16,
                    isExpanded: true,
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
                  ),
                ),
              )
            : Container(),
        //state
        const SizedBox(
          height: 10,
        ),
        countryvalue == "India" || countryvalue == "Choose Country"
            ? TextFieldText(
                text: 'State',
              )
            : Container(),

        countryvalue == "India" || countryvalue == "Choose Country"
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: customDropDownDecoration(),
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedState,
                    iconSize: 30,
                    elevation: 16,
                    isExpanded: true,
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
                    // validator: (value) => value == 'Choose Province'
                    //     ? "Choose Province"
                    //     : null,
                    items: stateName
                        .map/*<DropdownMenuItem<String>>*/((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              )
            : Container(),
        // district
        TextSizeBox(),

        TextFieldText(
          text: 'District',
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: districtController,
          validator: (value) =>
              value == null || value.isEmpty ? "Enter District" : null,
          decoration: customDecoration("", ""),
        ),

        //municipality
        TextSizeBox(),
        TextFieldText(
          text: 'Municipality',
        ),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: municipalityController,
          validator: (value) =>
              value == null || value.isEmpty ? "Enter Municipality" : null,
          decoration: customDecoration("", ""),
        ),

        TextSizeBox(),
        TextFieldText(
          text: 'Ward Number',
        ),

        TextFormField(
          keyboardType: TextInputType.number,
          controller: wardNumber,
          validator: (value) =>
              value == null || value.isEmpty ? "Enter Ward Number" : null,
          decoration: customDecoration("", ""),
        ),
        TextSizeBox(),
        TextFieldText(
          text: "City/Village/Area",
        ),
        TextFormField(
          controller: address,
          validator: (value) =>
              value == null || value.isEmpty ? "Enter Tole" : null,
          decoration: customDecoration("", ""),
        ),
        TextSizeBox(),
        TextFieldText(
          text: 'Number of Employees.',
        ),
        TextFormField(
            controller: branchnumbercontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Number of Employees";
              }
              return null;
            },
            decoration: customDecoration(
              "0",
              "",
            )),

        TextSizeBox(),
        DefaultButton(
          text: "Create New Branch",
          press: () {
            BranchService().createBranch();
          },
        )
      ],
    );
  }
}
