import 'package:flutter/material.dart';

class MessagesContainer extends StatelessWidget {
  final String title;
  final String date;
  final String imageurl;
  const MessagesContainer({super.key, required this.title, required this.date, required this.imageurl});

  @override
  Widget build(BuildContext context) {
     return ListTile(
      title: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,),
      subtitle: Text(date,style: TextStyle(color: Colors.grey),),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: const Color.fromARGB(255, 153, 238, 155),
           
        ),
        child: Center(child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(imageurl),
        )),
      ),
    );
  }
}