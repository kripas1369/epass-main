// import 'package:flutter/material.dart';
// import 'package:pass/Constant/colors.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/body.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Form/formOne.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/button.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/text.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
//
// import 'Form/formSecond.dart';
//
// class QrScanScreen extends StatelessWidget {
//   final String orgId;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//    QrScanScreen({super.key, required this.orgId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: MyAppBar(scaffoldKey: _scaffoldKey),
//         body: Padding(
//           padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//
//             // width: 300, // Set the width as per your requirements
//             height: 300, // Set the height as per your requirements
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color:primaryColor, // Specify the border color here
//                 width: 1.0, // Specify the border width here
//               ),
//             ),
//             child:Column(
//               children: [
//                 Spacer(),
//                 HeadingText(text: 'ARE YOU VISITING ALONG?',),
//                 Spacer(),
//                 ScanDefaultButton(text: "YES ",press: (){
//
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => FormSecondScreen(
//                       orgId: orgId,)),
//                   );
//                 },),
//                 Spacer(),
//                 ScanWhiteDefaultButton(text: "NO ",press: (){
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ManualScreen()),
//                   );
//                 },),
//                 Spacer(),
//                 SizedBox(height: 120,)
//
//
//
//
//               ],
//             )
//           ),
//         )
//     );
//   }
// }