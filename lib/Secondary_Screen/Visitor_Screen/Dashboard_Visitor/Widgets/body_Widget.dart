import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/banner_Widget.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/history_Widget.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/kycfill_Widget.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Dashboard_Visitor/Widgets/statsboxWidget.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/screens/history_screen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Service_Login_Details/Controller/controller.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Controller/visitor_list_Controller.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/routes.dart';

import '../../Service_Login_Details/loginDetailsService.dart';

class DashBody extends StatefulWidget {
  const DashBody({Key? key}) : super(key: key);

  @override
  State<DashBody> createState() => _DashBodyState();
}

class _DashBodyState extends State<DashBody> {
  late UserController userController;
  late String userId;

  @override
  void initState() {
    super.initState();
    userController = Get.find();
    userId = userController.userId.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          KycContainer(),
          SizedBox(height: 10),
          BannerContainer(),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stats',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFF090A0A),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Monthly',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
          SmallSizedBox(),
          StatsBoxWidget(),
          SizedBox(
            height: 5,
          ),

          DashHistoryContainer(),
          // HistoryBody(),
          SizedBox(
            height: 24,
          ),
          BannerContainer(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

///Fill KYC Form
// Container buidContainer()async{
//   var profileData = await getLoginprofile(context);
//   if (profileData != null && profileData.containsKey('is_kyc_verified')) {
//     // showLoading();
//     bool isKYC = profileData['is_kyc_verified'];
//     isKYC
//         ? Navigator.pushNamedAndRemoveUntil(
//             context, Routes.bottomnavigationScreen, (route) => false)
//         : Navigator.pushNamed(context, Routes.visitorScreen);
//   }
//   Get.offAllNamed(Routes.welcomeScreen);
//   return Container(
//     width: 382.37,
//     height: 58.98,
//     decoration: ShapeDecoration(
//       color: Color(0xFFEBF6FF),
//       shape: RoundedRectangleBorder(
//         side: BorderSide(width: 1, color: Color(0xFF0F75BC)),
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         SizedBox(
//           width: 279.87,
//           child: Text(
//             'Take a moment to verify your KYC details to ensure a secure and smooth experience.',
//             textAlign: TextAlign.justify,
//             style: TextStyle(
//               color: Color(0xFF090A0A),
//               fontSize: 12,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//         Text(
//           'Fill KYC',
//           textAlign: TextAlign.justify,
//           style: TextStyle(
//             color: Color(0xFF0F75BC),
//             fontSize: 12,
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w700,
//             height: 0.12,
//           ),
//         ),
//
//       ],
//     ),
//   );
// }
