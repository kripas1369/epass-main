import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

import '../../Widgets/appbar.dart';
import '../models/orghistory.dart';
import '../components/detail_element_tile.dart';

class HistoryDetailScreen extends StatelessWidget {
  // int index;
  // List<Results> details;

  HistoryDetailScreen({
    super.key,
    // required this.details,
    // required this.index,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Visit history details',
        textcolor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/abouticon.png'),
          ),
          SizedBox(
            height: 16,
          ),
          Text("Epass Pvt Ltd",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: primaryColor)),
          SizedBox(
            height: 14,
          ),
          Divider(
            height: 26,
            thickness: 4,
            color: Color(
              0xfff4f4f4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Container(
              child: Column(children: [
                DetailElementTile(
                  icon: Icons.numbers,
                  heading: "Serial Number",
                  headingData: '1',
                ),
                SizedBox(
                  height: 10,
                ),
                DetailElementTile(
                  icon: Icons.calendar_today_outlined,
                  heading: "Date and Time",
                  headingData: "1 Jan 2024 & 06:41",
                ),
                SizedBox(
                  height: 10,
                ),
                DetailElementTile(
                  icon: Icons.location_on_outlined,
                  heading: "Address",
                  headingData: "Kathmandu, Nepal",
                ),
                SizedBox(
                  height: 10,
                ),
                DetailElementTile(
                  icon: Icons.ac_unit,
                  heading: "Branch",
                  headingData: "Nuwakot",
                ),
                SizedBox(
                  height: 10,
                ),
                DetailElementTile(
                  icon: Icons.chat_bubble_outline,
                  heading: "Purpose",
                  headingData: "Meeting",
                ),
                SizedBox(
                  height: 10,
                ),
                DetailElementTile(
                  icon: Icons.star_outline,
                  heading: "Experience",
                  headingData: '2.4',
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Download Details",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.file_download_outlined,
                        color: primaryColor,
                        size: 20,
                      )
                    ],
                  )),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Share Details",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.share_outlined,
                        color: primaryColor,
                        size: 20,
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
