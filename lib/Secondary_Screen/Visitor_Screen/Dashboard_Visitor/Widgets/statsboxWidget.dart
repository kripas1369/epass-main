import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';

class StatsBoxWidget extends StatelessWidget {
  const StatsBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.only(right: 12),
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          buildContainer(
              ricon: Icons.arrow_back_outlined,
              icon: Icons.account_tree,
              text: "Visited Branches",
              number: "50"),
          buildContainer(
              ricon: Icons.arrow_back_outlined,
              icon: Icons.check_circle_outlined,
              text: "Number of Visits",
              number: "20"),
          buildContainer(
              ricon: Icons.arrow_back_outlined,
              icon: Icons.calendar_today_outlined,
              text: "Manual Entry Visits",
              number: '240'),
          buildContainer(
              ricon: Icons.arrow_back_outlined,
              icon: Icons.qr_code_scanner,
              text: "QR Scan Visits",
              number: "200"),
        ],
      ),
    );
  }
}

Container buildContainer(
    {required IconData ricon,
    required IconData icon,
    required String text,
    required String number}) {
  return Container(
    width: 179,
    height: 140,
    decoration: ShapeDecoration(
      color: Colors.white, // You can customize the color as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    padding: const EdgeInsets.all(10),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: iconColor),
            Spacer(),
            RotatedBox(
                quarterTurns: 2,
                child: Icon(ricon, size: 30, color: iconColor)),
          ],
        ), // Adjust icon size and color
        Text(
          number,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
      ],
    ),
    // child: Text("ok"),
  );
}
