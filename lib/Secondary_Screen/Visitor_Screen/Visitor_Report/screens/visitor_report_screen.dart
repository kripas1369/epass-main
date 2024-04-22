import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

import '../components/visitor_report_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.75,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search any features and lists",
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.sort,
              size: 30,
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return VisitorReportCard();
          },
        ),
      ],
    );
  }
}
