import 'package:flutter/material.dart';

class CustomTextVisitor extends StatelessWidget {
  final String field;
  final String value;
  const CustomTextVisitor({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text("$field:",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
          Text(value,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal),)
        ],
      ),
    );
  }
}