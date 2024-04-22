import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Constant/image.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Scan_Screen/Screen/Manual_Entry_Sceen/body.dart';
import 'package:pass/test.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 50),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.9,
        // color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //     height: 60,
            //     // color: Colors.white,
            //     child: ListTile(
            //       // horizontalTitleGap: 23,
            //       contentPadding: EdgeInsets.only(right: 15,),
            //
            //
            //         title: Text("Hello",
            //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            //         subtitle: Text("Kripas Khatiwada",
            //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),),
            //
            //         leading: CircleAvatar(child: Icon(Icons.person)),
            //         trailing: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(Icons.search,size: 30,color: Colors.white,)),
            //             IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(Icons.notifications_none_outlined,size: 30,color: Colors.white,)),
            //           ],
            //         ))
            // ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                  onTap:(){     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManualScreen(),
                      ));;},
                      child: buildColumn(AppImages.vregister, "Visitor \n Register")),
                  buildColumn(AppImages.cregister, "Customer \n Register"),
                  buildColumn(AppImages.meeting, "Meeting \n Appointment"),
                  buildColumn(AppImages.checking, "Check In/ \n Check Out"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Column buildColumn(String iconPath, String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        child: Image.asset(iconPath),
        radius: 28,
        backgroundColor: circularAvatarColor,
      ),
      SizedBox(height: 10,),
      Text(text,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
    ],
  );
}
