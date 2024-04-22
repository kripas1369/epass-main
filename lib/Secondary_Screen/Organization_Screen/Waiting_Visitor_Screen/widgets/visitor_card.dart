import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Waiting_Visitor_Screen/widgets/custom_text_visitor.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Waiting_Visitor_Screen/widgets/visitors_button.dart';


class VisitorCard extends StatelessWidget {
  const VisitorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: primaryColor)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.55,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextVisitor(field: "Name", value: "Tyson Cannnie"),
                            CustomTextVisitor(field: "Purpose", value: "Invoice Renew"),
                            CustomTextVisitor(field: "Vehicle", value: "No"),
                            CustomTextVisitor(field: "With Team", value: "Yes"),
                            CustomTextVisitor(field: "Team Members", value: "04"),
                            CustomTextVisitor(field: "Visiting From", value: "Star Link"),
                            CustomTextVisitor(field: "Vehicle Number", value: "04-XDE-38"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.27,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.13,
                              width: MediaQuery.of(context).size.width*0.27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1472&q=80"),
                                fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                         VisitorButtons(text: "Approve", color: backbuttonColor),
                         SizedBox(height: 10,),
                         VisitorButtons(text: "Decline", color: nextbuttonColor)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

