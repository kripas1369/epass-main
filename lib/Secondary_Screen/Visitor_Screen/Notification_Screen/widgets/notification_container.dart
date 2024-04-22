import 'package:flutter/material.dart';

class NotificationContainer extends StatelessWidget {
  final String title;
  final String date;
  final IconData icon;
  const NotificationContainer({super.key, required this.title, required this.date, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,),
      subtitle: Text(date,style: TextStyle(color: Colors.grey),),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          color: const Color.fromARGB(255, 153, 238, 155),
           
        ),
        child: Center(child: Icon(icon)),
      ),
    );
    
  }
}