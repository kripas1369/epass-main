import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/text.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/QRScan_Screen/Widgets/textfield.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/button.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';
import 'package:pass/routes.dart';

import '../Service/vqr_scanner_service.dart';


class SuccessScreen extends StatefulWidget {
  final String purposeofvisit;

  final String orgId;
  final String address;
  final String fullname;
  final String mobilenumber;
  final String email;
  // final String numberofvisitor;
  // final String vehicalnumber;

  const SuccessScreen(
      {super.key,

        required this.purposeofvisit,
        required this.address,
        required this.fullname,
        required this.mobilenumber,
        required this.email,
        required this.orgId});
  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int rating = 0;
  TextEditingController feedbackController = TextEditingController();
  void _updateRating(int newRating) {
    setState(() {
      rating = newRating;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _scaffoldKey,
        // appBar: MyAppBar(scaffoldKey: _scaffoldKey),
      appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            height: 600,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               Spacer(),
                Center(child: CustomQrHeading(text: 'Welcome to XYZ Company!!',)),
              Spacer(),
                Center(child: Image.asset(AppImages.successimg)),
                Spacer(),
                Center(child: CustomQrHeading(text: 'Congratulation, Visiting Access Granted !',)),
                Spacer(),
                Center(child: CustomQrTitle(text: "How was your experience?",)),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 1; i <= 5; i++)
                      IconButton(
                        icon: Icon(
                          rating >= i ? Icons.star : Icons.star_border,
                          color: rating >= i ? starColor : Colors.blueAccent[100],
                        ),
                        onPressed: () {
                          _updateRating(i);
                        },
                        iconSize: 50,
                      ),
                  ],
                ),
                Spacer(),
            Center(
              child: Container(
                // Set the background color here
                color: containerColor,
                // Set the height of the container to control the TextField height
                height: 90, // Adjust this value as needed
                // Add padding if needed
                padding: EdgeInsets.all(1.0),
                // Add a child TextField widget
                child: TextFormField(
                  controller: feedbackController,
                  validator: (value) =>
                  value == null || value.isEmpty ? "Enter Tole" : null,
                  decoration: InputDecoration(
                    // You can customize the TextField decoration here
                    hintText: 'Please write your feedback about your experience',
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none, // Remove border
                  ),
                  style:  TextStyle(color: Colors.black54),
                ),
              ),
          ),
                Spacer(),

                NextButton(
                  text: "Submit",
                  press: (){
                  QrScannerService().postscanner(
                    context: context,
                    orgId: widget.orgId,
                    purpose: widget.purposeofvisit,
                    address: widget.address,
                    fullname: widget.fullname,
                    mobilenumber: widget.mobilenumber,
                    email: widget.email,

                    // numberofvisitor: widget.numberofvisitor,
                    // havevehicle: widget.isvehicle, vehiclenumber: widget.vehicalnumber,

                  );
                  // Navigator.pushNamed(context, Routes.identityScreen);
                },),
                Spacer(),
              ],

            ),
          ),
        )
    );
  }
}
