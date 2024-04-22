// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pass/Constant/api_routes.dart';
// import 'package:pass/Constant/colors.dart';
// import 'package:pass/Constant/image.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Textfield/successScreen.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/button.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/text.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/textfield.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/service/vqr_scanner_service.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
// import 'package:pass/Widgets/row_icon_text.dart';
// import 'package:pass/Widgets/textfield.dart';
//
// class FormSecondScreen extends StatefulWidget {
//   final String orgId;
//
//   const FormSecondScreen({
//     Key? key,
//     required this.orgId,
//   }) : super(key: key);
//
//   @override
//   State<FormSecondScreen> createState() => _FormSecondScreenState();
// }
//
// class _FormSecondScreenState extends State<FormSecondScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final GlobalKey<FormState> key = GlobalKey<FormState>();
//   String purposeValue = "New Account";
//   late List<String> countryName = ["New Account", "Meeting", "General Advice", "Assistance", "Personal Work"];
//   TextEditingController visitingFromController = TextEditingController();
//
//   Future<List<Map<String, dynamic>>> fetchData() async {
//     String apiUrl = '${ApiUrl.baseurl}/organization/${widget.orgId}';
//
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return List<Map<String, dynamic>>.from(data);
//     } else {
//       throw Exception("Failed to load data: ${response.statusCode}");
//     }
//   }
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   fetchData();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: _scaffoldKey,
//       appBar: DashAppBar(
//         scaffoldKey: _scaffoldKey,
//         title: 'QR Scan Details',
//         textcolor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: key,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 15,right: 5),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(widget.orgId),
//                 SizedBox(height: 32,),
//                 Center(
//                   child: CircleAvatar(
//                     backgroundColor: Colors.black12,
//                     radius: 90,
//                   ),
//                 ),
//                 SizedBox(height: 32,),
//                 Center(child:    Text(
//                   'Here is your visit details',
//                   style: TextStyle(
//                     color: Color(0xFF090A0A),
//                     fontSize: 16,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w600,
//                     height: 0.09,
//                   ),
//                 ),),
//                 SizedBox(height: 40,),
//
//
//                 SizedBox(height: 10),
//                 HeadingText(
//                   text: 'Visitor Details',
//                 ),
//                 SizedBox(height: 12,),
//                 TextRowIcon(
//                   title: 'Visitor Date: ',
//                   subtitle: "21 Jan, 2024",
//                   icon: Icons.date_range_outlined, iconColor: iconColor,),
//                 SizedBox(height: 10,),
//                 TextRowIcon(
//                   title: 'Visitor Name: ',
//                   subtitle: "kripas khatiwada",
//                   icon: Icons.person, iconColor: iconColor,),
//                 SizedBox(height: 10,),
//                 TextRowIcon(
//                   title: 'Visitor Name: ',
//                   subtitle: "98508347485",
//                   icon: Icons.phone_android_rounded, iconColor: iconColor,),
//                 SizedBox(height: 10,),
//                 TextRowIcon(
//                   title: 'Visitor Name: ',
//                   subtitle: "kripask50@gmail.com",
//                   icon: Icons.email_outlined, iconColor: iconColor,),
//                 SizedBox(height: 10,),
//                 TextRowIcon(
//                   title: 'Visitor Name: ',
//                   subtitle: "kathmandu",
//                   icon: Icons.location_on_outlined, iconColor: iconColor,),
//                 SizedBox(height: 10,),
//                 TextRowIcon(
//                   title: 'Visitor Name: ',
//                   subtitle: "Meeting",
//                   icon: Icons.messenger_outline_outlined, iconColor: iconColor,),
//                 SizedBox(height: 40),
//
//                 Center(
//                   child: Container(
//                     width: 164,
//                     height: 164,
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: 4,
//                           strokeAlign: BorderSide.strokeAlignCenter,
//                           color: Color(0xFF0F75BC),
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Center(
//                   child: SizedBox(
//                     width: 374,
//                     child: Text(
//                       'Thank you for visiting. Hope ot see you soon again.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF898989),
//                         fontSize: 12,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//
//                 Row(
//                   children: [
//                     Container(
//                       width: 192.52,
//                       height: 48,
//                       decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 1, color: Color(0xFF0F75BC)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Download Details',
//                             style: TextStyle(
//                               color: Color(0xFF0F75BC),
//                               fontSize: 13,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Icon(Icons.download,color: primaryColor,)
//
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 12,),
//                     Container(
//                       width: 170,
//                       height: 48,
//                       // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                       decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 1, color: Color(0xFF0F75BC)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//
//                         children: [
//                           Text(
//                             'Share Details',
//                             style: TextStyle(
//                               color: Color(0xFF0F75BC),
//                               fontSize: 16,
//                               fontFamily: 'Inter',
//                               fontWeight: FontWeight.w400,
//                               height: 0.09,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Icon(Icons.share,color: primaryColor,)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30),
//                 ScanDefaultButton(
//                   text: "SUBMIT AND VISIT",
//                   press: () {
//                     if (key.currentState!.validate()) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SuccessScreen(
//                             address: "SD",
//                             purposeofvisit: purposeValue,
//                             visitingfrom: visitingFromController.text,
//                             orgId: widget.orgId,
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
