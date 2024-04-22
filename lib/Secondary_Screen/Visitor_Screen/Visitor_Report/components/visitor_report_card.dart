import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Visitor_Report/screens/visitor_report_detail_screen.dart';

import '../../../../Constant/colors.dart';

class VisitorReportCard extends StatelessWidget {
  const VisitorReportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("1 Jan, 2024"),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Visitor Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Charlie Chapline"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("04:22"),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Mobile Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("9876543210"),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              print("Clicked");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisitorReportDetails(),
                ),
              );
            },
            child: Text(
              "View All Details".toUpperCase(),
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
