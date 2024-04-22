import 'package:flutter/material.dart';
import 'package:pass/Constant/colors.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/widgets/messages_container.dart';
import 'package:pass/Secondary_Screen/Organization_Screen/Notification_Screen/widgets/notification_container.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/Notification_Screen/Service/notification_service.dart';
import 'package:pass/Secondary_Screen/Visitor_Screen/State/Service/visitor_history_server.dart';
import 'package:timeago/timeago.dart' as timeago;

class VisitorNotificationScreenBody extends StatefulWidget {
  const VisitorNotificationScreenBody({super.key});
  initState(){
    NotificationService().getallnotification();
  }

  @override
  State<VisitorNotificationScreenBody> createState() => _VisitorNotificationScreenBodyState();
}

class _VisitorNotificationScreenBodyState extends State<VisitorNotificationScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        SizedBox(
          height: 15,
        ),
                        Text(userId),
                        FutureBuilder(
                          future: NotificationService().getallnotification(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(), // Show a loading indicator
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'), // Show an error message if there's an error
                              );
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  String title = snapshot.data![index].title ?? '';
                                  String message = snapshot.data![index].message ?? '';
                                  String createdAt = snapshot.data![index].createdAt ?? '';
                                  bool isSeen = snapshot.data![index].isSeen ?? false;

                                  return NotificationContainer(
                                    title: title,
                                    message: message,
                                    createdAt: createdAt,
                                    isSeen: isSeen,
                                    date: "timeAgo",
                                    icon: Icons.person_outline,
                                  );
                                },
                              );
                            }
                          },
                        ),

                        ListTile(
                          title: Row(
                            children: [
                              // Spacer(),
                              Text("New User Created",maxLines: 1,overflow: TextOverflow.ellipsis,),
                              Spacer(),
                              Text(
                                '12 Jan, 2024 | 14:02',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF898989),
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0.33,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text("New user has been created by sub admin 2.",style: TextStyle(color: Colors.grey,fontSize: 10),),
                          leading:  Container(
                            width: 48,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5F3FE),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Icon(Icons.notifications_none_outlined,color: primaryColor,),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              // Spacer(),
                              Text("Visitor Deleted",maxLines: 1,overflow: TextOverflow.ellipsis,),
                              Spacer(),
                              Text(
                                '12 Jan, 2024 | 14:02',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF898989),
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0.33,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text("New user has been created by sub admin 2.",style: TextStyle(color: Colors.grey,fontSize: 10),),
                          leading:  Container(
                            width: 48,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5F3FE),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Icon(Icons.notifications_none_outlined,color: primaryColor,),
                          ),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              // Spacer(),
                              Text("New User Created",maxLines: 1,overflow: TextOverflow.ellipsis,),
                              Spacer(),
                              Text(
                                '12 Jan, 2024 | 14:02',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF898989),
                                  fontSize: 8,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0.33,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text("The Visitor has been deleted successfully.",style: TextStyle(color: Colors.grey,fontSize: 10),),
                          leading:  Container(
                            width: 48,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5F3FE),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Icon(Icons.notifications_none_outlined,color: primaryColor,),
                          ),
                        )

                      ],
                    ),
                  )
      ],
    );
  }
}
