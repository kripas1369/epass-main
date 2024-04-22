import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/History_Screen/components/detail_element_tile.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Widgets/appbar.dart';

class VisitorReportDetails extends StatelessWidget {
  VisitorReportDetails({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashAppBar(
        scaffoldKey: _scaffoldKey,
        title: "Visitor Report Details",
        textcolor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  DetailElementTile(
                    icon: Icons.person_outline,
                    heading: "Serial Number",
                    headingData: "1",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.calendar_today_outlined,
                    heading: "Date",
                    headingData: "21 Jan, 2024",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.timer_outlined,
                    heading: "Time",
                    headingData: "14:21",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.phone_android_outlined,
                    heading: "Mobile",
                    headingData: "9876543210",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.email_outlined,
                    heading: "Email Address",
                    headingData: "charlie@gmail.com",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.star,
                    heading: "ID Type",
                    headingData: "Citizenship",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.star,
                    heading: "ID Number",
                    headingData: "12-2334-344234",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.chat_bubble_outline,
                    heading: "Purpose",
                    headingData: "Meeting",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.not_listed_location_outlined,
                    heading: "Visited By",
                    headingData: "QR Scanning",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.check_circle_outlined,
                    heading: "Visit Status",
                    headingData: "Failed",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.connected_tv_outlined,
                    heading: "Channel",
                    headingData: "App",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.star_outline,
                    heading: "Experience",
                    headingData: "2",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.star,
                    heading: "Visited Id",
                    headingData: "998776555677",
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 4,
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  DetailElementTile(
                    icon: Icons.business,
                    heading: "Visited Organization Name",
                    headingData: "Epass Pvt Ltd",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.location_on_outlined,
                    heading: "Address",
                    headingData: "Kathmandu, Nepal",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.account_tree_outlined,
                    heading: "Branch",
                    headingData: "Baneshwor Branch",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.account_tree_outlined,
                    heading: "Branch Number",
                    headingData: "12",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  DetailElementTile(
                    icon: Icons.business,
                    heading: "Organization Type",
                    headingData: "Private",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
