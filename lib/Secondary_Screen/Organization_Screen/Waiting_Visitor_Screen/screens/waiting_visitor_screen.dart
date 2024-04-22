import 'package:flutter/material.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Waiting_Visitor_Screen/widgets/visitor_card.dart';


class WaitingVisitorBody extends StatelessWidget {
  const WaitingVisitorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("WAITING VISITORS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
        SizedBox(height: 10,),
        ListView.builder(
          itemCount: 6,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
          return VisitorCard();
        },)
      ],
    );
  }
}