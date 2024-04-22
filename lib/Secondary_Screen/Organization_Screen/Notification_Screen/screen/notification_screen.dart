import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/widgets/messages_container.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/widgets/notification_container.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Notifications",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                  // return NotificationContainer(title: "New user Created Successfully", date: "Just Now", icon: Icons.person_outline);
                },),
                                Text("Messages",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                  return MessagesContainer(title: "New user Created Successfully", date: "Just Now", imageurl: "https://images.unsplash.com/photo-1682687220198-88e9bdea9931?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80");
                },)
              ],
            ),
          ),
        )
      ],
    );
  }
}