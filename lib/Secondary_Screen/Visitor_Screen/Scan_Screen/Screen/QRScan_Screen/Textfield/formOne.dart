import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pass/Constant/api_routes.dart';
import 'package:pass/Constant/colors.dart';
import 'package:http/http.dart' as http;
import 'package:pass/Secondary_Screen/Visitor_Screen/Edit_Profile_Screen/Service/get_profile_service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Service/vqr_scanner_service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/formSecond.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/successScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/LoginDetailsService.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/row_icon_text.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';

import '../Widgets/text.dart';

class FormOneScreen extends StatefulWidget {
  final String orgId;

  const FormOneScreen({super.key, required this.orgId});
  @override
  State<FormOneScreen> createState() => _FormOneScreenState();
}

class _FormOneScreenState extends State<FormOneScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController purposeController = TextEditingController();

  final key = GlobalKey<FormState>();

  Future<Map<String, dynamic>> fetchData() async {
    String apiUrl = '${ApiUrl.baseurl}/organization/10';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return Map<String, dynamic>.from(data[0]);
      } else {
        throw Exception("No data received from the server.");
      }
    } else {
      print(response.body);
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    fetchUserData();
    getuserdata();
  }

  String? fullName;
  String? mobileNumber;


  Future<void> fetchUserData() async {
    final service = EditProfileService();
    final userData = await service.getUserData();

    if (userData != null) {
      setState(() {
        fullName =  userData['full_name'];
        mobileNumber = userData['mobile_number'];
      });
    }
  }
  Map<String, dynamic>? userdata;
  final newpassword = TextEditingController();
  bool obscureNewPassword = true;

  Future getuserdata() async {
    print("*********");
    print("*********");
    print("*********");

    userdata = await getLoginprofile(context);
    print(userdata);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: DashAppBar(scaffoldKey: _scaffoldKey, title: 'QR Scan Details', textcolor: Colors.black,),
        body: SingleChildScrollView(
          child:  FutureBuilder(
            future: fetchData(),
          builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
           } else if (snapshot.hasError) {
           return Center(
            child: Text('Error: ${snapshot.error}'),
          );
         } else {
           final Map<String, dynamic>? data = snapshot.data as Map<String, dynamic>?;

          if (data != null) {
            TextEditingController addressController = TextEditingController(text: userdata!['address']??"");
            TextEditingController mobilenumberController = TextEditingController(text: userdata!['mobile_number']??"");
            TextEditingController emailController = TextEditingController(text: userdata!['email']??"");
            TextEditingController fullnameController = TextEditingController(text: userdata!['full_name']??"");
            return  Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 430,
                    height: 427,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment(-1.00, -0.05),
                        begin: Alignment(1, 0.05),
                        colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                      ),
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40,),
                        Container(
                          width: 111.33,
                          height: 111.33,
                          decoration: ShapeDecoration(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              side:
                              BorderSide(width: 4, color: Colors.white),
                              borderRadius: BorderRadius.circular(55.67),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // TextRowIcon(title: 'thei', subtitle: 'asdfa', icon: Icons.add, iconColor: Colors.white,),
                        Text(
                          '${data["full_name"] ?? ""}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.verified,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8,),
                            Text(
                              '${data["address"] ?? "Kathmandu"}',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Container(
                      width: 382,
                      height: 553,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                            spreadRadius: 0,
                          ),],),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                        child: Form(
                          key: key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSizeBox(),
                              TextFieldText(
                                text: "Full name",
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.name,
                                  readOnly: true,
                                  controller: TextEditingController(text: userdata!['full_name']??""),
                                  decoration: customPrefixDecoration(
                                      "Input your mobile number",
                                      "",
                                      Icon(Icons.person,color: iconColor,))),
                              TextSizeBox(),
                              TextFieldText(
                                text: 'Mobile Number',
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  readOnly: true,
                                  controller: mobilenumberController,
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return "Please Enter Mobile Number";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: customPrefixDecoration(
                                      "Input your mobile number",
                                      "",
                                      Icon(Icons.phone_android_rounded,color: iconColor,))),
                              TextSizeBox(),
                              TextFieldText(
                                text: 'Email',
                              ),
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  readOnly: true,
                          
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Email Address";
                                    }
                                    return null;
                                  },
                                  decoration: customPrefixDecoration(
                                      "Input your Email Address",
                                      "",
                                      Icon(Icons.mail_outline,color: iconColor,))),
                              TextSizeBox(),
                              TextFieldText(
                                text: 'Address',
                              ),
                              TextFormField(
                                  // keyboardType: TextInputType.none,
                                  controller: addressController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Input address";
                                    }
                                    return null;
                                  },
                                  decoration: customPrefixDecoration(
                                      "Input address",
                                      "",
                                      Icon(Icons.location_on_outlined,color: iconColor,))),
                              TextSizeBox(),
                              TextFieldText(
                                text: 'Purpose',
                              ),
                              TextFormField(
                                  // keyboardType: TextInputType.none,
                                  controller: purposeController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please Enter Input purpose";}
                                    return null;
                                  },
                                  decoration: customPrefixDecoration(
                                      "Input purpose",
                                      "",
                                      Icon(Icons.messenger_outline_outlined,color: iconColor,))),
                              TextSizeBox(),
                              TextSizeBox(),
                              DefaultButton(
                                press: (){
                                  if (key.currentState != null && key.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SuccessScreen(
                                          orgId: widget.orgId,
                                          address: addressController.text,
                                          purposeofvisit: purposeController.text,
                                          fullname: fullnameController.text,
                                          mobilenumber: mobilenumberController.text,
                                          email: emailController.text,
                                        ),
                                      ),
                                    );
                                    print("clicked");
                                    print("clicked");
                                    print("clicked");
                                    print("clicked");
                                  }
                                },
                                text: "Proceed",
                              ),
                              // DefaultButton(
                              //   text: "Submit",
                              //   press: (){
                              //     QrScannerService().postscanner(
                              //       orgId: widget.orgId,
                              //       address: addressController.text,
                              //       fullname: fullnameController.text,
                              //       mobilenumber: mobilenumberController.text,
                              //       email: emailController.text,
                              //       context: context,
                              //       purpose: purposeController.text,
                              //
                              //       // numberofvisitor: widget.numberofvisitor,
                              //       // havevehicle: widget.isvehicle, vehiclenumber: widget.vehicalnumber,
                              //
                              //     );
                              //     // Navigator.pushNamed(context, Routes.identityScreen);
                              //   },),
                          
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('Data is null.'),
            );
          }
        }
      },
    )

    ));
  }
}
