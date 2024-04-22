import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Exception/validation.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Address_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Identify_Screen/date_textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Screen/Kyc_Form_Screen/Contact_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';

enum Gender { Male, Female, Others }

enum Nationality { Nepal, Other }

enum Marital { Married, Unmarried }

class IdentityTextfiled extends StatefulWidget {
  const IdentityTextfiled({Key? key}) : super(key: key);

  @override
  State<IdentityTextfiled> createState() => _IdentityTextfiledState();
}

class _IdentityTextfiledState extends State<IdentityTextfiled> {
  final _formKey = GlobalKey<FormState>();
  bool isIdentificationTypeSelected = true;

  Gender? _selectedgender;
  bool isgenderselected = false;
  bool _radioSelectedErr = false;

  Nationality? _selectedNationali;
  bool isnationality = false;

  Marital? _selectedMarital;
  bool ismaritualselected = false;

  var gendervalue = 'Choose Gender';
  String identificationType = 'Identification Type';
  final TextEditingController identityNumber = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController fathername = TextEditingController();
  final TextEditingController mothername = TextEditingController();
  final TextEditingController grandfathername = TextEditingController();
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupation = TextEditingController();

  NepaliDateTime selectedDate = NepaliDateTime.now();
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
                      text: '01/',
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
          FormTitleText(
            text: "Personal Details",
          ),
          TextSizeBox(),
          TextSizeBox(),
          TextFieldText(
            text: 'Full Name',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: firstname,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Full Name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Full Name",
                  "",
                  Icon(
                    Icons.perm_identity,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          TextFieldText(
            text: 'Mobile Number',
          ),
          SmallSizedBox(),
          TextFormField(
            controller: mobilenumber,
            keyboardType: TextInputType.number,
            validator: (value) => validateMobile(value),
            decoration: customPrefixDecoration(
                "Mobile Number",
                "",
                Icon(
                  Icons.phone_android_rounded,
                  color: iconColor,
                )),
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'Email (Optional)',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: emailController,
              validator: (value) => validateEmail(value),
              decoration: customPrefixDecoration(
                  "Input Your Email",
                  "",
                  Icon(
                    Icons.email_outlined,
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
            // validator: (value) {
            //   if (englishdateofbirth.text.toString() ==
            //       DateTime.now().toString()) {
            //     return 'Please Choose Valid Date';
            //   }
            //   if ((int.parse(DateFormat('yyyy')
            //       .format(DateTime.now()))) -
            //       int.parse(DateFormat('yyyy').format(
            //           DateTime.parse(englishdateofbirth.text.toString()))) <
            //       16) {
            //     return 'Age Must be greater than 16';
            //   }
            //   return null;
            // },

            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (currentFocus.focusedChild != null) {
                    currentFocus.focusedChild!.unfocus();
                  }
                  selectEnglishDate(context);
                },
                icon: const Icon(Icons.date_range_outlined),
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
          TextFieldText(
            text: 'Gender',
          ),
          SmallSizedBox(),
          Row(
            children: <Widget>[
              Radio<Gender>(
                value: Gender.Male,
                groupValue: _selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender = value;
                    isgenderselected = true;
                  });
                },
                activeColor: nextbuttonColor,
                fillColor: MaterialStateColor.resolveWith(
                  (states) => nextbuttonColor,
                ),
              ),
              Text(
                'Male',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Radio<Gender>(
                value: Gender.Female,
                groupValue: _selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender = value!;
                    isgenderselected = true;
                  });
                },
                activeColor: primaryColor,
                fillColor:
                    MaterialStateColor.resolveWith((states) => primaryColor),
              ),
              Text(
                'Female',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Radio<Gender>(
                value: Gender.Others,
                groupValue: _selectedgender,
                onChanged: (Gender? value) {
                  setState(() {
                    _selectedgender = value!;
                    isgenderselected = true;
                  });
                },
                activeColor: primaryColor,
                fillColor:
                    MaterialStateColor.resolveWith((states) => primaryColor),
              ),
              Text(
                'Other',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          TextSizeBox(),
          TextFieldText(
            text: 'Grandfather Full Name',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: grandfathername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Grandfather Full Name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input grandfather full name",
                  "",
                  Icon(
                    Icons.perm_identity,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          TextFieldText(
            text: 'Father Full Name',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: fathername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Father Full Name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input Father Full Name",
                  "",
                  Icon(
                    Icons.perm_identity,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          TextFieldText(
            text: 'Mother Full Name',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: mothername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Input mother full name";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input mother full name",
                  "",
                  Icon(
                    Icons.phone_android_rounded,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          TextFieldText(
            text: 'Occupation',
          ),
          SmallSizedBox(),
          TextFormField(
              controller: occupation,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Input occupation";
                }
                return null;
              },
              decoration: customPrefixDecoration(
                  "Input occupation",
                  "",
                  Icon(
                    Icons.business_center_outlined,
                    color: iconColor,
                  ))),
          TextSizeBox(),
          TextSizeBox(),
          DefaultButton(
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
                  Get.to(() => VisitorAddressScreen(
                        kycFromModel: KycFromModel(
                          name: firstname.text,
                          fatherName: fathername.text,
                          motherName: mothername.text,
                          grandfatherName: grandfathername.text,
                          // aadharcardback:
                          // aadharcardback == null ? "" : aadharcardback!.path,
                          // aadharcardfront: aadharcardfront == null
                          //     ? ""
                          //     : aadharcardfront!.path,
                          // citizenshipback: citizenshipback == null
                          //     ? ""
                          //     : citizenshipback!.path,
                          // citizenshipfront: citizenshipfront == null
                          //     ? ""
                          //     : citizenshipfront!.path,
                          // panfile: panfile == null ? "" : panfile!.path,
                          // passportPanfile: passportPanfile == null
                          //     ? ""
                          //     : passportPanfile!.path,
                          // voterfile: voterfile == null ? "" : voterfile!.path,
                          // identityNumber: identityNumber.text,
                          // identityType: identificationType,
                          //
                          //
                          // gender: _selectedgender!.toString().split('.')[1],
                          // nationality:
                          // _selectedNationali!.toString().split('.')[1],
                          // maritalStatus:
                          // _selectedMarital!.toString().split('.')[1],
                        ),
                      ));
                }
              }
            },
            text: "Continue",
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
