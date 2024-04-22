import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';
import 'package:pass/Widgets/sizebox.dart';


class SettingScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(scaffoldKey: _scaffoldKey),
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SETTINGS",style: TextStyle(fontWeight: FontWeight.w900,color:primaryColor),),
              TextSizeBox(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // Container background color
                  borderRadius: BorderRadius.circular(7), // Circular border
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset from the top-left corner
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(children: [

                    Text("Fingerprint Login",style: TextStyle(fontWeight: FontWeight.w900,color:primaryColor),),
                    Spacer(),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (newValue) {
                            print("object");
                          },
                        ),
                        Text("Enable"),
                        Checkbox(
                          value: true,
                          onChanged: (newValue) {
                            print("object");
                          },
                        ),
                        Text("Disable")

                      ],
                    ),
                    Spacer(),


                  ],),
                ),
              ),
              TextSizeBox(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white, // Container background color
                  borderRadius: BorderRadius.circular(7), // Circular border
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset from the top-left corner
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(children: [

                    Text("Fingerprint Login",style: TextStyle(fontWeight: FontWeight.w900,color:primaryColor),),


                  ],),
                ),
              )

            ],
          ),
        ) );
  }
}
