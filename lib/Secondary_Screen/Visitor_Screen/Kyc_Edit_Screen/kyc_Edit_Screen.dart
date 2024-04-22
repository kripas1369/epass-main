// import 'package:flutter/material.dart';
// import 'package:pass/Secondary_Screen/Visitor_Screen/Kyc_Preview_Screen/Model/model.dart';
//
// import 'Kyc_EditForm_Screen/Identify_Screen/body.dart';
//
// class EditKYCPage extends StatefulWidget {
//   final KYCDataModel kycData;
//
//   EditKYCPage({required this.kycData});
//
//   @override
//   _EditKYCPageState createState() => _EditKYCPageState();
// }
//
// class _EditKYCPageState extends State<EditKYCPage> {
//   late TextEditingController nameController;
//   late TextEditingController fatherNameController;
//   // Add more controllers for other fields
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the controllers with the KYC data
//     nameController = TextEditingController(text: widget.kycData.name);
//     fatherNameController = TextEditingController(text: widget.kycData.fatherName);
//     // Initialize more controllers for other fields
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit KYC Data'),
//       ),
//       body: Form(
//         // Use a Form to manage the editing and updating of data
//         child: ListView(
//           padding: EdgeInsets.all(16.0),
//           children: [
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: fatherNameController,
//               decoration: InputDecoration(labelText: 'Father\'s Name'),
//             ),
//             // Add more TextFormField widgets for other fields
//             ElevatedButton(
//               onPressed: () {
//                 // Update KYC data with the new values in the controllers
//                 // widget.kycData.name = nameController.text;
//                 // widget.kycData.fatherName = fatherNameController.text;
//
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EditIdentifyScreen()),
//                 );
//               },
//               child: Text('Update KYC'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
