import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Exception/validation.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/Model/manual_model.dart';
import 'dart:io';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Preview_Screen/prewiew_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/textfield.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';

class ManualTextField extends StatefulWidget {
  @override
  State<ManualTextField> createState() => _ManualTextFieldState();
}
// Results class definition
class Results {
  final int? id;
  final String? organizationName;

  Results({this.id, this.organizationName});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      organizationName: json['organization_name'],
    );
  }
}

// OrganizationService class definition


class OrganizationService {
  Future<List<Results>> getOrganizationList() async {
    final response = await http.get(Uri.parse("${ApiUrl.baseurl}/organization/list"));

    if (response.statusCode == 200) {
      List<dynamic> results = json.decode(response.body)['results'];
      return results.map((result) => Results.fromJson(result)).toList();
    } else {
      throw Exception('Failed to load organization list');
    }
  }
}


class _ManualTextFieldState extends State<ManualTextField> {
  final _formKey = GlobalKey<FormState>();
  String orgvalue = "Choose";
  late List<String> orgName = ["Choose", "Yes", "No"];
  String vehicalvalue = "Yes";
  late List<String> vehicalList = ["Yes", "No"];
  String proposevalue = "Yes";
  late List<String> proposeList = ["Yes", "No"];


  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController totalnumber = TextEditingController();
  TextEditingController organization = TextEditingController();
  TextEditingController purpose = TextEditingController();
  TextEditingController vehiclenumber = TextEditingController();
  TextEditingController identityNumber = TextEditingController();
  TextEditingController numberofvisitor = TextEditingController();
  TextEditingController remarks = TextEditingController();
  String selectedIdentificationType = 'Select type of ID'; // Updated variable name
  bool isIdentificationTypeSelected = true;
  late List<String> identificationTypeList = [
    'Select type of ID',
    'Citizenship',
    'Passport',
    'PAN',
    'Voter ID',
    // 'Business Registration Certificate',
  ];
  late Future<List<Results>> organizationList;
  Results? selectedOrganization;

  @override
  void initState() {
    super.initState();
    initializeOrganizationList();
  }

  Future<void> initializeOrganizationList() async {
    organizationList = OrganizationService().getOrganizationList();
  }



  int? selectedOrgid;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomHeading(text: 'Manual Entry'),
          TextSizeBox(),
          TextFieldText(
            text: 'Organization',
          ),

          FutureBuilder<List<Results>>(
            future: organizationList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                // Define options from snapshot data or any other source
                List<Results> options = snapshot.data ?? []; // Assuming snapshot.data contains your list of options

                return Container(
                  padding: const EdgeInsets.all(0.2),
                  child: Autocomplete<Results>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return options.where((Results result) =>
                      result.organizationName != null &&
                          result.organizationName!
                              .toLowerCase()
                              .startsWith(textEditingValue.text.toLowerCase()));
                    },
                    displayStringForOption: (Results result) => result.organizationName ?? '',
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      fieldTextEditingController.text =
                          selectedOrganization?.organizationName ?? '';

                      return TextFormField(
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Select Organization',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:Colors.grey,
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
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          hoverColor: primaryColor,
                          prefixIcon: Icon(Icons.business,color: iconColor,), // You can add your prefix icon here
                        ),
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      );
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: options.length > 10
                              ? 5.0 * options.length
                              : 5.0 * options.length + 200,
                          child: Material(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.blueAccent[800],
                            child: ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Results option = options.elementAt(index);
                                return GestureDetector(
                                  onTap: () {
                                    if (option != null) {
                                      print("ID ${option.id}");
                                      onSelected(option);
                                    }
                                  },
                                  child: ListTile(
                                    title: Text(
                                      option.organizationName ?? 'Unknown',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    onSelected: (Results selection) {
                      setState(() {
                        selectedOrganization = selection;
                        selectedOrgid=selection.id;
                      });
                    },
                  ),
                );
              }
            },
          ),


          TextSizeBox(),

          TextFieldText(
            text: 'Full Name',
          ),
          TextFormField(
              textInputAction: TextInputAction.next,
              controller: fullname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter full name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input your full name", "", Icon(Icons.person,color: iconColor,))),
          TextSizeBox(),

          TextFieldText(
            text: 'Full Address',
          ),
          TextFormField(
              textInputAction: TextInputAction.next,
              controller: address,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Full Address";
                }
                return null;
              },
              decoration: customPrefixDecoration("Please enter  address", "",
                  Icon(Icons.location_on_outlined,color: iconColor,))),
          TextSizeBox(),
          TextFieldText(
            text: 'Mobile Number',
          ),
          TextFormField(
              textInputAction: TextInputAction.next,
              controller: mobilenumber,
              keyboardType: TextInputType.number,
              // maxLength: 10,
              validator: validateMobile,
              decoration: customPrefixDecoration(
                  "Input your mobile number", "", Icon(Icons.phone_android_rounded,
                  color: iconColor))),

          TextSizeBox(),
          TextFieldText(
            text: 'Email Address',
          ),
          TextFormField(
              textInputAction: TextInputAction.next,
              controller: email,
              validator: validateEmail,
              decoration: customPrefixDecoration("Input your full address", "",
                  Icon(Icons.email_outlined,color: iconColor))),
          TextSizeBox(),
          TextFieldText(
            text: 'Number of visitor',
          ),
          TextFormField(
              controller: numberofvisitor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Visitor Number";
                }
                return null;
              },
              decoration: customPrefixDecoration(

                "Enter Visitor Number",
                "",
                  Icon(Icons.people_alt_outlined,color: iconColor,)
              )),

          TextSizeBox(),
          TextFieldText(
            text: 'Type of ID',
          ),
          DropdownButtonFormField<String>( 

            decoration: dropdownInputDecoration(
              hintText: '',
              boarderColor: iconColor,
              press: (){}, primaryColor: iconColor, icon: Icons.medical_information_outlined),

            value: selectedIdentificationType,
            items: identificationTypeList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,style: TextStyle(color: iconColor),),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedIdentificationType = value!;
              });
            },
            hint: Text('Select type of ID',style: TextStyle(color: iconColor),), // Updated hint text
          ),
          TextSizeBox(),

          TextFieldText(
            text: 'ID Number',
          ),
          //identification type error message
          const SizedBox(
            height: 10,
          ),
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
                  Icon(Icons.medical_information_outlined,color: iconColor,)

              )),
          TextSizeBox(),
          TextFieldText(
            text: 'Vehicle',
          ),
          Container(
            height: 60,
            width:400 ,
            // color: Colors.2,
            child: Row(
              children: [
                Radio<String>(
                  value: 'Yes',
                  groupValue: vehicalvalue,
                  activeColor: primaryColor,

                  onChanged: (String? newValue) {
                    setState(() {
                      vehicalvalue = newValue!;
                      if (vehicalvalue == "Yes") {
                        // Do something if "Yes" is selected
                      }
                    });
                  },
                ),
                Text('Yes'),
                SizedBox(width: 90,),
                Radio<String>(
                  activeColor: primaryColor,
                  value: 'No',
                  groupValue: vehicalvalue,
                  onChanged: (String? newValue) {
                    setState(() {
                      vehicalvalue = newValue!;
                      if (vehicalvalue == "No") {
                        // Do something if "No" is selected
                      }
                    });
                  },
                ),
                Text('No'),

              ],
            ),
          ),

          TextSizeBox(),
          Visibility(
            visible: vehicalvalue == "Yes" ? true : false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldText(
                  text: 'Vehicle Number',
                ),
                TextFormField(
                    controller: vehiclenumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Number";
                      }
                      return null;
                    },
                    decoration: customPrefixDecoration(
                      "Vehicle Number",
                      "",
                        Icon(Icons.directions_bike_sharp,color: iconColor,)

                    )),
                TextSizeBox(),
              ],
            ),
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'Propose',
          ),
          TextFormField(
              controller: purpose,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Propose";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                "Input purpose",
                "",
                  Icon(Icons.messenger_outline,color: iconColor,)

              )),

          const SizedBox(
            height: 20,
          ),

          DefaultButton(
            text: "CONTINUE",
            press: () async {
              if (_formKey.currentState!.validate()) {
                ManuallyFormModel manualFromModel = ManuallyFormModel(

                  orgid:selectedOrgid,
                  address: address.text.toString(),
                  identification_type: selectedIdentificationType,
                  identification_number: identityNumber.text,
                  email: email.text.toString(),
                  mobilenumber: mobilenumber.text.toString(),
                  purpose: purpose.text.toString(),
                  havevehicle:vehicalvalue,
                  vehiclenumber: vehiclenumber.text.toString(),
                  fullname: fullname.text.toString(),
                  organization:organization.text.toString(),
                  numberofVisitor: numberofvisitor.text.toString(),
                  remark: remarks.text.toString(), visiting_from: 'ktm',

                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ManualPreviewScreen(manual: manualFromModel),
                    ));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildAutocomplete(List<Results> options) {
    return Container(
      padding: const EdgeInsets.all(0.2),
      child: Autocomplete<Results>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return options.where((Results result) =>
              result.organizationName!
                  .toLowerCase()
                  .startsWith(textEditingValue.text.toLowerCase()));
        },
        displayStringForOption: (Results result) => result.organizationName!,
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted) {
          fieldTextEditingController.text =
              selectedOrganization?.organizationName ?? '';

          return TextFormField(
            keyboardType: TextInputType.text,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'Your Organization Name',
              border: OutlineInputBorder(),
            ),
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: options.length > 10
                  ? 5.0 * options.length
                  : 5.0 * options.length + 120,
              child: Material(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.blueAccent[800],
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Results option = options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        print("ID ${option.id}");
                        onSelected(option);
                      },
                      child: ListTile(
                        title: Text(
                          option.organizationName ?? 'Unknown', // Handle null here
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },


        onSelected: (Results selection) {
          setState(() {
            selectedOrganization = selection;
          });
        },
      ),
    );
  }
}
