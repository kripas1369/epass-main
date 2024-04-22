import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Widgets/appbar.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Drawer_Screen/DrawerScreen.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/Widgets/button.dart';
import 'package:pass/Widgets/sizebox.dart';
import 'package:pass/Widgets/text.dart';
import 'package:pass/Widgets/textfield.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Message',
        textcolor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSizeBox(),
            TextFieldText(
              text: 'Municipality / Rural Municipality',
            ),
            SizedBox(height: 5,),
            TextFormField(
              controller: titleController,
              validator: (value) =>
              value == null || value.isEmpty ? "Enter Tole" : null,
              decoration: customDecoration("Enter Tole", ""),
            ),
            TextSizeBox(),
            TextFieldText(
              text: 'Municipality / Rural Municipality',
            ),
            SizedBox(height: 5,),
            Container(
              width: 382,
              height: 115.23,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFA2A2A2)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Add a child TextField widget
              child: TextFormField(
                controller: messageController,
                validator: (value) =>
                value == null || value.isEmpty ? "Enter Tole" : null,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  hintText: 'Input message',
                  hintStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none, // Remove border
                ),
                style:  TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 100,),
            DefaultButton(
              text: "SEND",
              press: (){

              },
            )


          ],
        ),
      ),
    );
  }
}
