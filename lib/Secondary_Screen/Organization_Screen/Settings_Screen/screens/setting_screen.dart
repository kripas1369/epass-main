import 'package:flutter/material.dart';
import 'package:pass/Widgets/sizebox.dart';

import '../../../../Constant/colors.dart';

class OrgSettingScreenBody extends StatelessWidget {
  const OrgSettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SETTINGS",style: TextStyle(fontWeight: FontWeight.w900,color:primaryColor),),
              TextSizeBox(),
              Text("Do you want to approve visitor before access?"),
              Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          value: true,
                          activeColor: primaryColor,
                          
                          onChanged: (newValue) {
                            print("object");
                          },
                        ),
                        Text("Yes"),
                        Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          value: true,
                          activeColor: primaryColor,
                          onChanged: (newValue) {
                            print("object");
                          },
                        ),
                        Text("No")

                      ],
                    ),
                    Text("Do you want CHECK-IN and CHECK-OUT Feature?"),
              Row(
                      children: [
                        Checkbox(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          value: true,
                          activeColor: primaryColor,
                          onChanged: (newValue) {
                            print("object");
                          },
                        ),
                        Text("Yes"),
                        Checkbox(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          value: true,
                          activeColor: primaryColor,
                          onChanged: (newValue) {
                            print("object");
                          },
                        ),
                        Text("No")

                      ],
                    ),
                    SizedBox(height: 20,),
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

                    Text("Change password",style: TextStyle(fontWeight: FontWeight.w900,color:primaryColor),),


                  ],),
                ),
              )
      ],
    );
  }
}