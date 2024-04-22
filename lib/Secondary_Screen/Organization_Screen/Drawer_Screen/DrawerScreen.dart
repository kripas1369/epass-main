import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Primary_Screen/Login_Screen/Service/org_login_service.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branches_Screen/Screen.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Edit_Org_Profile/body.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Kyc_Preview_Screen/body.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerWidgets_Screen/appVersion.dart';
import 'package:pass/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constant/tokenStore.dart';
import '../../../Primary_Screen/Change_Password_Screen/body.dart';
import '../../../Primary_Screen/Forgot_Screen/body.dart';
import '../../Visitor_Screen/About_Us_Screen/aboutUs_Screen.dart';
import '../../Visitor_Screen/MyQR/body.dart';
import '../../Visitor_Screen/PrivacyPolicyScreen/privatePolicyScreen.dart';
import '../Homepage_Screen/model/visit_history_model.dart';

class MyOrgDrawer extends StatefulWidget {
  @override
  State<MyOrgDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyOrgDrawer> {
  Map<String, dynamic>? orgdata;
  Future getorgdata() async {
    orgdata = await TokenStorage().getOrgdata();
    print("****************************");
    print(orgdata);
    print("****************************");
    setState(() {});
  }

  @override
  void initState() {
    getorgdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kprimarycolor,
      child: orgdata == null
          ? Center()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      title: Text(
                        orgdata!["full_name"],
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      onTap: () {
                        if (orgdata!["qr"] == null) {
                          print("No qr");
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyQrScreen(qrcode: orgdata!["qr"]),
                              ));
                        }
                      },
                      leading: MyBullet(),
                      title: Text(
                        "My QR",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      leading: MyBullet(),
                      title: Text(
                        "Current Visitors",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Menus",
                      style: TextStyle(color: Colors.black87),
                    ),
                    ListTile(
                      leading: Icon(Icons.blur_circular_sharp),
                      title: Text("Overview"),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder_copy_outlined),
                      title: Text("Visitors"),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder_copy_outlined),
                      title: Text("Staff"),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder_copy_outlined),
                      title: Text("Notice"),
                    ),
                    ListTile(
                      leading: Icon(Icons.folder_copy_outlined),
                      title: Text("Messages"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BranchScreen()),
                        );
                      },
                      leading: Icon(Icons.folder_copy_outlined),
                      title: Text("Branches"),
                    ),
                    ListTile(
                      leading: Icon(Icons.people_alt_outlined),
                      title: Text("History"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.orgnotificationScreen);
                      },
                      leading: Icon(Icons.menu_book),
                      title: Text("Notification"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pages",
                      style: TextStyle(color: Colors.black87),
                    ),
                    Theme(
                      data: ThemeData(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                          title: Text(
                            "Profile",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                          leading: Icon(Icons.account_box_outlined),
                          iconColor: Colors.black,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditOrgProfile()),
                                );
                              },
                              leading: SizedBox(
                                width: 3,
                              ),
                              title: Text(
                                "View Profile",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditOrgProfile()),
                                );
                              },
                              leading: SizedBox(
                                width: 3,
                              ),
                              title: Text(
                                "Edit Profile",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            ListTile(
                              leading: SizedBox(
                                width: 3,
                              ),
                              onTap: () {
                                Get.to(OrgKycPreviewScreen());
                              },
                              title: Text(
                                "Kyc",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                if (orgdata!["qr"] == null) {
                                  print("No qr");
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyQrScreen(qrcode: orgdata!["qr"]),
                                      ));
                                }
                              },
                              leading: SizedBox(
                                width: 3,
                              ),
                              title: Text(
                                "My QR Code",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ]),
                    ),
                    Theme(
                      data: ThemeData(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                          title: Text(
                            "Setting",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                          leading: Icon(Icons.settings),
                          iconColor: Colors.black,
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChangePassword(),
                                    ));
                              },
                              leading: SizedBox(
                                width: 3,
                              ),
                              title: Text(
                                "Change Password",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen(),
                                    ));
                              },
                              leading: SizedBox(
                                width: 3,
                              ),
                              title: Text(
                                "Forget Password",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            ListTile(
                              leading: SizedBox(
                                width: 3,
                              ),
                              onTap: () {
                                OrgLoginService()
                                    .setupfingerprintlogin(context);
                              },
                              title: Text(
                                "Set fingerprint",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                            ListTile(
                              leading: SizedBox(
                                width: 3,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateCheckScreen(),
                                    ));
                              },
                              title: Text(
                                "App Version",
                                style: TextStyle(color: Colors.black87),
                              ),
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
                              leading: SizedBox(
                                width: 3,
                              ),
                              title: Text(
                                "LogOut",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ]),
                    ),
                    ListTile(
                      leading: Icon(Icons.collections_bookmark_outlined),
                      title: Text(
                        "Rewards",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.error),
                      title: Text(
                        "Issues",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.business_rounded),
                      title: Text(
                        "Organisation",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutUsScreen(),
                            ));
                      },
                      leading: SizedBox(
                        width: 10,
                      ),
                      title: Text(
                        "About Us",
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
                      leading: SizedBox(
                        width: 10,
                      ),
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
                      leading: SizedBox(
                        width: 10,
                      ),
                      title: Text(
                        "Terms & Conditions",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 10,
                      ),
                      title: Text(
                        "FAQs",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 10,
                      ),
                      title: Text(
                        "Security",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: 10,
                      ),
                      title: Text(
                        "Socials",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
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
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
    );
  }
}
