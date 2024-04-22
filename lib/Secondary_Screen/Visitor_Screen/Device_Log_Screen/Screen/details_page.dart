import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Widgets/button.dart';

import '../../../Organization_Screen/Widgets/appbar.dart';

class DeviceLogDetailsPage extends StatefulWidget {
  final String devicename;
  final String location;
  final String date;
  const DeviceLogDetailsPage({super.key, required this.devicename, required this.location, required this.date });

  @override
  State<DeviceLogDetailsPage> createState() => _DeviceLogDetailsPageState();
}

class _DeviceLogDetailsPageState extends State<DeviceLogDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime createAt;
  late String formattedDateTime;

  @override
  void initState() {
    super.initState();

    // Your response create_at string
    String createAtString = widget.date;

    // Convert the string to DateTime
    createAt = DateTime.parse(createAtString);

    // Format the DateTime using intl package
    formattedDateTime = DateFormat.yMd().add_Hms().format(createAt);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Device Log',
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE5F3FE),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(Icons.notifications_none_outlined,color: primaryColor,),
                ),
                SizedBox(width: 10,),
                Text(
                  'New Login Detected',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
            SizedBox(
              width: 382,
              child: Text(
                'Your account has been accessed from a new device. For security purposes, please review the details below and verify this login.',
                style: TextStyle(
                  color: Color(0xFF090A0A),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: 382,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Device:',
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text:"${widget.devicename}\n",
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Location: ',
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "${widget.location}\n",
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Date & Time:',
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text:'Formatted Date and Time: ${formattedDateTime ?? "Loading..."}',
                      style: TextStyle(
                        color: Color(0xFF090A0A),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
               width: 382,
               child: Text(
                  '\u2022 This notification helps ensure the security of your account.'
                  '\n \u2022 If you receive this alert unexpectedly, change your password immediately.'
                  '\n \u2022 Contact support if you need assistance or did not attempt this login.',

          style: TextStyle(
              color: Color(0xFF090A0A),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
            SizedBox(height: 30,),

            DefaultButton(
              press: (){},
              text: "YES,IT'S ME",
            ),
            SizedBox(height: 15,),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(450, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the value to control the curvature
                  ),
                ),
                onPressed: (){},
                child:Text(
                  "No, it’s not me",
                  style: TextStyle(
                    fontSize: (20),
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
