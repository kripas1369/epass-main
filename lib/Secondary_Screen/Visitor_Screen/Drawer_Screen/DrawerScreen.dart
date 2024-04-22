import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Constant/tokenStore.dart';
import 'package:pass/Primary_Screen/Change_Password_Screen/body.dart';
import 'package:pass/Primary_Screen/Forgot_Screen/body.dart';
import 'package:pass/Primary_Screen/Login_Screen/Service/vis_login_service.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/screen/notification_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/About_Us_Screen/aboutUs_Screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Device_Log_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerWidgets_Screen/appVersion.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerWidgets_Screen/custom_bottom_sheet.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Edit_Profile_Screen/Service/get_profile_service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Edit_Profile_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Service/kycService.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Message_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/MyQR/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/PrivacyPolicyScreen/privatePolicyScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/loginDetailsService.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Visitor_Report/body.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';

import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Branches_Screen/VisitorBranchScreen.dart';
import '../Kyc_Screen/Kyc_Form_Screen/Models/kyc_from_model.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
  String? profilename;
  String? profilelocation;
  String? profilepicture;

  @override
  void initState() {
    super.initState();
    fetchUserProfileData();
    getuserdata();

  }

  void fetchUserProfileData() async {
    EditProfileService editProfileService = EditProfileService();
    Map<String, dynamic>? profileData = await editProfileService.getUserData();
    if (profileData != null) {
      setState(() {
        profilename = profileData['name'];
        profilelocation = profileData['address'];
        profilepicture=profileData["profile_picture"];
      });
    }
  }


  bool light = true;

  @override
  Widget build(BuildContext context) {
    return userdata == null
        ? Center()
        : SingleChildScrollView(
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 280),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        leading: Image.asset(AppImages.kycIcon),
                        onTap: () {
                          final KycFromModel kycFromModel;
                          KYCService().fetchKYCData();
                          // updateKycForm(kycData: {});
                          // Navigator.pushNamed(context, Routes.kycpreviewScreen);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KycPreviewScreen()),
                          );
                        },
                        title: Text(
                          "View KYC",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyQrScreen(
                                    qrcode: userdata!["qr"] ??
                                        'assets/images/qrimage.png'),
                              ));
                        },
                        leading: Image.asset(
                          AppImages.qrIcon,
                          height: 23,
                        ),
                        title: Text(
                          "My QR",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisitHistoryScreen(),
                              ));
                        },
                        leading: Image.asset(AppImages.orgIcon),
                        title: Text("View Organization"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisitHistoryScreen(),
                              ));
                        },
                        leading: Image.asset(AppImages.historyIcon),
                        title: Text("Visited History"),
                      ),
                      ListTile(
                        leading: Image.asset(AppImages.manualIcon),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ManualScreen(),
                              ));
                        },
                        title: Text(
                          "Manual Entry",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisitorReport(),
                              ));
                        },
                        leading: Icon(
                          Icons.book,
                          color: primaryColor,
                        ),
                        title: Text("Visitor Report"),
                      ),

                      Divider(
                        height: 50,
                        thickness: 4,
                        color: Color(0xfff4f4f4),
                      ),

                      Text(
                        "Settings",
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),

                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          );
                        },
                        leading: Icon(
                          Icons.lock_outline,
                          color: primaryColor,
                        ),
                        title: Text("Change Password"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeviceListScreen(),
                              ));
                        },
                        leading: Icon(
                          Icons.fingerprint,
                          color: primaryColor,
                        ),
                        title: Text("Enable Biometrics"),
                        trailing: Switch(
                          // This bool value toggles the switch.
                          value: light,
                          activeColor: primaryColor,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeviceListScreen(),
                              ));
                        },
                        leading: Icon(
                          Icons.laptop_outlined,
                          color: primaryColor,
                        ),
                        title: Text("Device Log"),
                      ),

                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeviceListScreen(),
                              ));
                        },
                        leading: Icon(
                          Icons.cloud_download_outlined,
                          color: primaryColor,
                        ),
                        title: Text("Check for Updates"),
                        trailing: Text(
                          'App version 1.00.00',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFA2A2A2),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                          ),
                        ),
                      ),

                      // Theme(
                      //   data: ThemeData(dividerColor: Colors.transparent),
                      //   child: ExpansionTile(
                      //       title: Text(
                      //         "Organization / Branch.",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.normal),
                      //       ),
                      //       leading: Icon(Icons.collections_bookmark_outlined),
                      //       iconColor: Colors.black,
                      //       children: [
                      //         ListTile(
                      //           onTap: () {
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       VisitorBranchScreen(),
                      //                 ));
                      //           },
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "View and search organization or branch",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //       ]),
                      // ),
                      // Theme(
                      //   data: ThemeData(dividerColor: Colors.transparent),
                      //   child: ExpansionTile(
                      //       title: Text(
                      //         "Visited history",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.normal),
                      //       ),
                      //       leading: Icon(Icons.history),
                      //       iconColor: Colors.black,
                      //       children: [
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "View waiting visit",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "View decline visit",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           onTap: () {},
                      //           title: Text(
                      //             "View branch wise visit",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "View manual entry visit",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //       ]),
                      // ),
                      // Theme(
                      //   data: ThemeData(dividerColor: Colors.transparent),
                      //   child: ExpansionTile(
                      //       title: Text(
                      //         "History / Report",
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.normal),
                      //       ),
                      //       leading: Icon(Icons.report),
                      //       iconColor: Colors.black,
                      //       children: [
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "View and search",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "Total visited",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           onTap: () {},
                      //           title: Text(
                      //             "Total organization visited",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "View purpose of visit",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "Daily, weekly, monthly, yearly",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //         ListTile(
                      //           onTap: () {},
                      //           leading: SizedBox(
                      //             width: 3,
                      //           ),
                      //           title: Text(
                      //             "Table, graph, chart",
                      //             style: TextStyle(color: Colors.black87),
                      //           ),
                      //         ),
                      //       ]),
                      // ),
                      // ListTile(
                      //   leading: Icon(Icons.collections_bookmark_outlined),
                      //   title: Padding(
                      //     padding: const EdgeInsets.only(left: 15),
                      //     child: Text(
                      //       "Rewards",
                      //       style: TextStyle(color: Colors.black87),
                      //     ),
                      //   ),
                      // ),
                      // ListTile(
                      //   leading: Icon(Icons.business_rounded),
                      //   title: Padding(
                      //     padding: const EdgeInsets.only(left: 15),
                      //     child: Text(
                      //       "Organisaiton",
                      //       style: TextStyle(color: Colors.black87),
                      //     ),
                      //   ),
                      // ),

                      Divider(
                        height: 50,
                        thickness: 4,
                        color: Color(0xfff4f4f4),
                      ),

                      Text(
                        "Legal",
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        leading: Image.asset(AppImages.aboutIcon),
                        title: Text(
                          "About Us",
                          style: TextStyle(color: Colors.black87),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUsScreen(),
                              ));
                        },
                      ),
                      ListTile(
                        leading: Image.asset(AppImages.privateIcon),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivatePolicyScreen(),
                              ));
                        },
                        title: Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivatePolicyScreen(),
                              ));
                        },
                        leading: Image.asset(AppImages.termsIcon),
                        title: Text(
                          "Terms & Conditions",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(AppImages.facqIcon),
                        title: Text(
                          "FAQs",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      Divider(
                        height: 50,
                        thickness: 4,
                        color: Color(0xfff4f4f4),
                      ),

                      Text(
                        "Support",
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.mail_outline,
                          color: primaryColor,
                        ),
                        title: Text(
                          "info@gmail.com",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone_android_rounded,
                          color: primaryColor,
                        ),
                        title: Text(
                          "9843234234",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),

                      ListTile(
                        leading: Image.asset(AppImages.contactIcon),
                        title: Text(
                          "9843234234",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),

                      ListTile(
                        leading: Icon(
                          Icons.message_outlined,
                          color: primaryColor,
                        ),
                        title: Text(
                          "Message",
                          style: TextStyle(color: Colors.black87),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageScreen(),
                              ));
                        },
                      ),

                      Divider(
                        height: 50,
                        thickness: 4,
                        color: Color(0xfff4f4f4),
                      ),

                      ListTile(
                        onTap: () {
                          AwesomeDialog(
                            autoHide: const Duration(seconds: 10),
                            context: context,
                            headerAnimationLoop: false,
                            dismissOnTouchOutside: false,
                            dismissOnBackKeyPress: false,
                            dialogType: DialogType.warning,
                            animType: AnimType.scale,
                            title: 'LogOut',
                            desc: 'Are you sure you want to logout?',
                            btnCancelOnPress: () {},
                            btnCancelColor: Colors.grey,
                            btnOkColor: primaryColor,
                            btnOkOnPress: () async {
                              Navigator.pushNamed(context, Routes.login);
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              sharedPreferences.clear();
                            },
                          ).show();
                        },
                        leading: Icon(
                          Icons.login,
                          color: primaryColor,
                        ),
                        title: Text(
                          "LogOut",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 430.08,
                  height: 152.42,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment(-1.00, -0.05),
                      begin: Alignment(1, 0.05),
                      colors: [Color(0xFF0F75BC), Color(0xFF25AAE1)],
                    ),
                  ),
                  alignment: Alignment.topRight,
                  child: Image.asset(
                   AppImages.topdot,
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Column(
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            padding: EdgeInsets.all(4),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  "$profilepicture",
                              )
                            ),
                          ),
                          Positioned(
                            top: 65,
                            left: 25,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  end: Alignment(-0.97, 0.25),
                                  begin: Alignment(0.97, -0.25),
                                  colors: [
                                    Color(0xFF0F75BC),
                                    Color(0xFF25AAE1)
                                  ],
                                ),
                                shape: CircleBorder(),
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userdata!['full_name']??"$profilename",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.verified,
                                  size: 18,
                                  color: Colors.green.shade600,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  userdata!['address'] ??"$profilelocation"??"KTM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  userdata!['mobile_number'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                userdata!['email'] != null
                                    ? Icon(
                                        Icons.email_outlined,
                                        size: 18,
                                        color: Colors.black,
                                      )
                                    : Container(),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  userdata!['email'] ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 60,
                              thickness: 5,
                              color: Color(0xfff4f4f4),
                            )
                          ],
                        ),
                      ),

                      // SizedBox(width:,),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
