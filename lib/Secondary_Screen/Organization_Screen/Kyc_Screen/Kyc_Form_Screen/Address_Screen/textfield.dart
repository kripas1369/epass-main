// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pass/Constant/colors.dart';
// import 'package:pass/Primary_Screen/Widgets/sizebox.dart';
// import 'package:pass/Primary_Screen/Widgets/text.dart';
// import 'package:pass/Primary_Screen/Widgets/textfield.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
//
// class AddressTextField extends StatefulWidget {
//   const AddressTextField({Key? key}) : super(key: key);
//
//   @override
//   State<AddressTextField> createState() => _AddressTextFieldState();
// }
// void sendData() {
//   final primaryNumberValue = municipality.text;
//   final secondaryNumberValue = district.text;
//   final emailValue = city.text;
//   final viberNumberValue = ward.text;
//
//   // Now you can use these values as needed, such as printing them.
//   print('Primary Mobile Number: $primaryNumberValue');
//   print('Secondary Mobile Number: $secondaryNumberValue');
//   print('Email: $emailValue');
//   print('Viber Number: $viberNumberValue');
//
// }
// final selectcolor = Color(0xDD0A66C2).withOpacity(0.2);
// final _formKey = GlobalKey<FormState>();
// String countryvalue="Choose Country";
// final municipality = TextEditingController();
// final district = TextEditingController();
// final city = TextEditingController();
// final ward = TextEditingController();
//
//
//
// bool addresstypeerror = false;
// late List<String> countryName=["Choose Country","Nepal","India"];
// late List<String> provinceName = [provinceValue];
// late List<String> districtName = [districtValue];
// late List<String> municipalityName = [municipality];
// late List<String> stateName = [selectedState];
// class _AddressTextFieldState extends State<AddressTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FormTitleText(text: "Address",),
//           TextSizeBox(),
//           FormTitleText(text: "Permanent Address",),
//           TextSizeBox(),
//           Text(
//             "Country",
//             style: TextStyle(
//               color: kprimarycolor,
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           // TextFormField(
//           //   controller: countryValue,
//           //   readOnly: true,
//           //   decoration: InputDecoration(
//           //       contentPadding: const EdgeInsets.symmetric(
//           //           vertical: 5.0, horizontal: 5.0),
//           //       fillColor: const Color(0xFF39B54A).withOpacity(0.2),
//           //       filled: true,
//           //       hintText: '',
//           //       hintStyle: const TextStyle(
//           //         fontSize: 14,
//           //         color: hintgrey,
//           //         fontWeight: FontWeight.w400,
//           //       ),
//           //       focusedBorder: OutlineInputBorder(
//           //           borderRadius: BorderRadius.circular(10),
//           //           borderSide: BorderSide(color: primaryColor)),
//           //       enabledBorder: OutlineInputBorder(
//           //         borderSide: BorderSide(
//           //           color: primaryColor,
//           //           width: 0.0,
//           //         ),
//           //         borderRadius: BorderRadius.circular(10),
//           //       ),
//           //       border: OutlineInputBorder(
//           //           borderRadius: BorderRadius.circular(10),
//           //           borderSide:
//           //               const BorderSide(color: Colors.deepPurple)),
//           //       hoverColor: primaryColor),
//           // ),
//           Container(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 5.0, vertical: 5.0),
//             decoration: BoxDecoration(
//               // color: const Color(0xFF39B54A).withOpacity(0.2),
//                 color:selectcolor,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: primaryColor, width: 0.4)),
//             height: 50,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 value: countryvalue,
//                 iconSize: 30,
//                 elevation: 16,
//                 isExpanded: true,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     countryvalue = newValue!;
//                     if (countryvalue == "Choose Province") {
//                       districtName = ['Choose District'];
//                       districtValue = districtName[0];
//                       municipalityName = ['Choose Municipality'];
//                       municipality = municipalityName[0];
//                     } else if(countryvalue=="Nepal") {
//                       // districtName = ['Choose District'];
//                       // districtValue = districtName[0];
//                       // municipalityName = ['Choose Municipality'];
//                       // municipality = municipalityName[0];
//                       // for (int i = 0;
//                       //     i <
//                       //         Address
//                       //             .district[selectedProvince]!.length;
//                       //     i++) {
//                       //   districtName.add(
//                       //       Address.district[selectedProvince]![i]);
//                       // }
//                     }else{
//                       // districtName.add();
//                     }
//                   });
//                 },
//                 // validator: (value) => value == 'Choose Province'
//                 //     ? "Choose Province"
//                 //     : null,
//                 items: countryName
//                     .map/*<DropdownMenuItem<String>>*/((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           //province
//           const SizedBox(
//             height: 10,
//           ),
//           countryvalue =="Nepal" || countryvalue=="Choose Country"?
//           Text(
//             "Province",
//             style: TextStyle(
//               color: primaryColor,
//             ),
//           ):Container(),
//           const SizedBox(
//             height: 5,
//           ),
//
//           countryvalue=="Nepal" || countryvalue=="Choose Country"?  Container(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 5.0, vertical: 5.0),
//             decoration: BoxDecoration(
//                 color:selectcolor,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: primaryColor, width: 0.4)),
//             height: 50,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 value: selectedProvince ?? provinceValue,
//                 iconSize: 30,
//                 elevation: 16,
//                 isExpanded: true,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedProvince = newValue!;
//                     if (selectedProvince == "Choose Province") {
//                       districtName = ['Choose District'];
//                       districtValue = districtName[0];
//                       municipalityName = ['Choose Municipality'];
//                       municipality = municipalityName[0];
//                     } else {
//                       districtName = ['Choose District'];
//                       districtValue = districtName[0];
//                       municipalityName = ['Choose Municipality'];
//                       municipality = municipalityName[0];
//                       for (int i = 0;
//                       i <
//                           Address
//                               .district[selectedProvince]!.length;
//                       i++) {
//                         districtName.add(
//                             Address.district[selectedProvince]![i]);
//                       }
//                     }
//                   });
//                 },
//                 // validator: (value) => value == 'Choose Province'
//                 //     ? "Choose Province"
//                 //     : null,
//                 items: provinceName
//                     .map/*<DropdownMenuItem<String>>*/((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ):Container(),
//           //state
//           const SizedBox(
//             height: 10,
//           ),
//           countryvalue =="India" || countryvalue=="Choose Country"?  Text(
//             "State",
//             style: TextStyle(
//               color: primaryColor,
//             ),
//           ):Container(),
//           const SizedBox(
//             height: 5,
//           ),
//           countryvalue=="India" || countryvalue=="Choose Country"?  Container(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 5.0, vertical: 5.0),
//             decoration: BoxDecoration(
//                 color:selectcolor,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: primaryColor, width: 0.4)),
//             height: 50,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 value: selectedState,
//                 iconSize: 30,
//                 elevation: 16,
//                 isExpanded: true,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedState = newValue!;
//                     if (selectedState == "Choose Province") {
//                       districtName = ['Choose District'];
//                       districtValue = districtName[0];
//                       municipalityName = ['Choose Municipality'];
//                       municipality = municipalityName[0];
//                     } else {
//                       districtName = ['Choose District'];
//                       districtValue = districtName[0];
//                       municipalityName = ['Choose Municipality'];
//                       municipality = municipalityName[0];
//                       for (int i = 0;
//                       i <
//
//                           districtList.length;
//                       i++) {
//                         districtName.add(
//                             districtList[i]);
//                       }
//                     }
//                   });
//                 },
//                 // validator: (value) => value == 'Choose Province'
//                 //     ? "Choose Province"
//                 //     : null,
//                 items: stateName
//                     .map/*<DropdownMenuItem<String>>*/((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ):Container(),
//           // district
//           const SizedBox(
//             height: 10,
//           ),
//
//           Text(
//             "District",
//             style: TextStyle(
//               color: primaryColor,
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//
//           TextFormField(
//             keyboardType: TextInputType.text,
//             controller: districtController,
//             validator: (value) => value == null || value.isEmpty
//                 ? "Enter District"
//                 : null,
//             decoration: customDecoration("",""),
//             // decoration: InputDecoration(
//             //     contentPadding: const EdgeInsets.symmetric(
//             //         vertical: 5.0, horizontal: 5.0),
//             //     fillColor: selectcolor,
//             //     filled: true,
//             //     hintText: 'City',
//             //     hintStyle: const TextStyle(
//             //       fontSize: 14,
//             //       color: hintgrey,
//             //       fontWeight: FontWeight.w400,
//             //     ),
//             //     focusedBorder: OutlineInputBorder(
//             //         borderRadius: BorderRadius.circular(10),
//             //         borderSide: BorderSide(color: primaryColor)),
//             //     enabledBorder: OutlineInputBorder(
//             //       borderSide: BorderSide(
//             //         color: primaryColor,
//             //         width: 0.0,
//             //       ),
//             //       borderRadius: BorderRadius.circular(10),
//             //     ),
//             //     border: OutlineInputBorder(
//             //         borderRadius: BorderRadius.circular(10),
//             //         borderSide:
//             //         const BorderSide(color: Colors.deepPurple)),
//             //     hoverColor: primaryColor),
//           ),
//
//
//
//
//
//
//
//
//
//           TextFieldText(text: 'Municipality',),
//           TextFormField(
//               controller: municipality,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Please Enter Municipality";
//                 }
//                 return null;
//               },
//               decoration:customDecoration("Municipality", "",)),
//
//           TextSizeBox(),
//           TextFieldText(text: 'City/Village/Area',),
//           TextFormField(
//               controller: district,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Please Enter City/Village/Area";
//                 }
//                 return null;
//               },
//               decoration:customDecoration(" City/Village/Area", "",)),
//           TextSizeBox(),
//           TextFieldText(text: 'Ward No',),
//           TextFormField(
//               controller: ward,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Please Enter Ward No";
//                 }
//                 return null;
//               },
//               decoration:customDecoration("Ward No", "",)),
//           // SizedBox(height: 100,),
//           Row(
//             children: [
//               Spacer(),
//               BackButtons(
//                 text: "Back",
//                 press: (){ Navigator.pop(context);},
//               ),
//               Spacer(),
//               Spacer(),
//               Spacer(),
//               NextButton(
//                 text: "Next",
//                 press:() async {
//                   if (_formKey.currentState!.validate()){
//                   }
//                 },
//               ),
//               Spacer(),
//

//
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/Other_Screen/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Kyc_Form_Screen/model/orgkycmodel.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Screen/Preview_kyc_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/address.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';

class AddressTextField extends StatefulWidget {
  OrgKycModel orgKycModel;
  AddressTextField({
    Key? key,
    required this.orgKycModel,
  }) : super(key: key);

  @override
  State<AddressTextField> createState() => _AddressTextFieldState();
}

class _AddressTextFieldState extends State<AddressTextField> {
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
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSizeBox(),
          FormTitleText(
            text: "Contact",
          ),
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
                items: countryName
                    .map/*<DropdownMenuItem<String>>*/((String value) {
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
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
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Spacer(),
              BackButtons(
                text: "Back",
                press: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              Spacer(),
              Spacer(),
              NextButton(
                text: "Next",
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    //  Navigator.pushNamed(context, Routes.otherScreen);
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => OrgOtherScreen(orgKycModel:
                    //    OrgKycModel(
                    //     aadharcardback: widget.orgKycModel.aadharcardback,
                    //  citizenshipback: widget.orgKycModel.citizenshipback,
                    //         citizenshipfront: widget.orgKycModel.citizenshipfront,
                    //         aadharcardfront: widget.orgKycModel.aadharcardfront,
                    //         panfile: widget.orgKycModel.panfile,
                    //         passportPanfile: widget.orgKycModel.passportPanfile,
                    //         voterfile: widget.orgKycModel.voterfile,
                    //         orgName: widget.orgKycModel.orgName,
                    //         estyear: widget.orgKycModel.estyear,
                    //         registernuber: widget.orgKycModel.registernuber,
                    //         identityNumber: widget.orgKycModel.identityNumber,
                    //         grandfatherName: widget.orgKycModel.grandfatherName,
                    //         whatsappViberNumber: widget.orgKycModel.whatsappViberNumber,

                    //         identityType: widget.orgKycModel.identityType,
                    //         emailAddress: widget.orgKycModel.emailAddress,
                    //         primaryMobileNumber: widget.orgKycModel.primaryMobileNumber,
                    //         secondaryMobileNumber: widget.orgKycModel.secondaryMobileNumber,
                    //         website: widget.orgKycModel.website,
                    //         permanentAddressCountry: countryvalue,
                    //         permanentAddressDistrict: districtController.text,
                    //         permanentAddressState: selectedState,
                    //         permanentAddressMunicipality: municipalityController.text,
                    //         permanentAddressWardNo: wardNumber.text,
                    //         permanentAddressCityVillageArea: city.text
                    //    )),));
                    Get.to(() => OrgPreviewScreen(
                        orgKycModel: OrgKycModel(
                            aadharcardback: widget.orgKycModel.aadharcardback,
                            citizenshipback: widget.orgKycModel.citizenshipback,
                            citizenshipfront:
                                widget.orgKycModel.citizenshipfront,
                            aadharcardfront: widget.orgKycModel.aadharcardfront,
                            panfile: widget.orgKycModel.panfile,
                            passportPanfile: widget.orgKycModel.passportPanfile,
                            voterfile: widget.orgKycModel.voterfile,
                            orgName: widget.orgKycModel.orgName,
                            vatnumber: widget.orgKycModel.vatnumber,
                            pannumber: widget.orgKycModel.pannumber,
                            estyear: widget.orgKycModel.estyear,
                            registernuber: widget.orgKycModel.registernuber,
                            identityNumber: widget.orgKycModel.identityNumber,
                            identityType: widget.orgKycModel.identityType,
                            emailAddress: widget.orgKycModel.emailAddress,
                            primaryMobileNumber:
                                widget.orgKycModel.primaryMobileNumber,
                            secondaryMobileNumber:
                                widget.orgKycModel.secondaryMobileNumber,
                            website: widget.orgKycModel.website,
                            permanentAddressCountry: countryvalue,
                            permanentAddressDistrict: districtController.text,
                            permanentAddressState: selectedState,
                            permanentAddressMunicipality:
                                municipalityController.text,
                            permanentAddressWardNo: wardNumber.text,
                            permanentAddressCityVillageArea: address.text,
                            grandfatherName: widget.orgKycModel.grandfatherName,
                            whatsappViberNumber:
                                widget.orgKycModel.whatsappViberNumber)));
                  }
                },
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
