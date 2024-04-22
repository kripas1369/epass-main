import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/LoginDetailsService.dart';

class OrgEditTextFrom extends StatefulWidget {
  const OrgEditTextFrom({super.key});

  @override
  State<OrgEditTextFrom> createState() => _EditTextFromState();
}

class _EditTextFromState extends State<OrgEditTextFrom> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  // UserModel? userModel;
  final key = GlobalKey<FormState>();

  String profileImagePath = '';

  XFile profileimage = XFile('');
  Map<String, dynamic>? userdata;

  Future getuserdata() async {
    userdata = await TokenStorage().getOrgdata();

    print(userdata);
    namecontroller.text = userdata!["full_name"];
    mobileController.text = userdata!["mobile_number"];
    emailcontroller.text = userdata!["email"];

    setState(() {});
  }

  _pickpassportsizephoto(BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );

    if (pickedFile != null) {
      setState(() {
        profileimage = pickedFile;
      });
    }

    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context, Function methodname) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choose option",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    methodname(context, ImageSource.gallery);
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
      },
    );
  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getuserdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Form(
          key: key,
          child:
              //        Column(
              //       children: [
              //         SizedBox(height: Get.height*0.4,),
              //         Center(
              //   child: CircularProgressIndicator(),
              // ),
              //       ],
              //     ):
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 55.0,
                            child: profileimage.path.isEmpty &&
                                    profileImagePath.isEmpty
                                ? const CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        AssetImage("assets/images/user.png"),
                                    radius: 55.0,
                                  )
                                : profileImagePath.isNotEmpty
                                    ? CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            NetworkImage(profileImagePath),
                                        radius: 50.0,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            FileImage(File(profileimage.path)),
                                        radius: 50.0,
                                      ))),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 230.0, top: 20),
                          child: InkWell(
                            onTap: () {
                              _showChoiceDialog(
                                  context, _pickpassportsizephoto);
                            },
                            child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(Icons.edit_outlined)),
                          ),
                        )),
                  ],
                ),
              ),
              Text(
                "First Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: namecontroller,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter name",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff555454),
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    hoverColor: primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                //  validator: (value) {
                //      if (value!.isEmpty) {
                //       return "Please enter your last name";
                //     }
                //     return null;

                //  },

                decoration: InputDecoration(
                    focusColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter mobile number",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff555454),
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    hoverColor: primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: addressController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                //  validator: (value) {
                //      if (value!.isEmpty) {
                //       return "Please enter your last name";
                //     }
                //     return null;

                //  },

                decoration: InputDecoration(
                    focusColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Address",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff555454),
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    hoverColor: primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                readOnly: true,
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter email",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff555454),
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: primaryColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff8E8383))),
                    hoverColor: primaryColor),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 4,
                  shadowColor: primaryColor.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          // color: primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Save changes",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
