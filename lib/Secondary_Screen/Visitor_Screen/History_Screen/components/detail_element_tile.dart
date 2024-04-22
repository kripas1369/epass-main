import 'package:flutter/material.dart';

import '../../../../Constant/colors.dart';

class DetailElementTile extends StatelessWidget {
  IconData icon;
  String heading;
  String headingData;

  DetailElementTile({
    super.key,
    required this.icon,
    required this.heading,
    required this.headingData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 24,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "$heading: ",
          softWrap: true,
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          headingData,
          maxLines: 2,
          style: TextStyle(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
