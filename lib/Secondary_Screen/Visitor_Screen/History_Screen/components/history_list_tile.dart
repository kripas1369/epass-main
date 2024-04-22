import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../Constant/colors.dart';

class HistoryListTile extends StatefulWidget {
  String organization;
  String address;
  String date;
  int index;
  Function() onPressed;

  HistoryListTile({
    super.key,
    required this.organization,
    required this.address,
    required this.date,
    required this.index,
    required this.onPressed,
  });

  @override
  State<HistoryListTile> createState() => _HistoryListTileState();
}

class _HistoryListTileState extends State<HistoryListTile> {
  late String formattedDateTime;
  late DateTime createAt;

  @override
  void initState() {
    super.initState();

    // Your response create_at string
    String createAtString = widget.date;

    // Convert the string to DateTime
    createAt = DateTime.parse(createAtString);

    // Format the DateTime using intl package
    formattedDateTime = DateFormat.yMd().add_Hms().format(createAt);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: widget.onPressed,
      title: Text(
        widget.organization,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.address,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Spacer(),
          Text(
            "${formattedDateTime ?? "Loading..."}",
            textAlign: TextAlign.right,
            maxLines: 20,
            style: TextStyle(
              color: Color(0xFF898989),
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      leading: Container(
        width: 48,
        height: 48,
        decoration: ShapeDecoration(
          color: Color(0xFFE5F3FE),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            widget.index.toString(),
            style: TextStyle(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
