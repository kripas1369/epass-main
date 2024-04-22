import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Branch_Detail_Screen/widget/textfieldfrom.dart';

class BranchDetailScreenBody extends StatelessWidget {
  const BranchDetailScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("Branch Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      Divider(
        color: Color.fromARGB(255, 204, 150, 130),
      ),
TextFieldFromBranch()
      ],
    );
  }
}