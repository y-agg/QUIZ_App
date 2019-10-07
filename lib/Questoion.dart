import 'package:flutter/material.dart';
class Questions extends StatelessWidget {
  final String ques;
  Questions(this.ques);
  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    margin: EdgeInsets.all(10),
    child:Text(ques, 
    style: TextStyle(fontSize: 28),
    textAlign: TextAlign.center,
    ),
    );
  }
}

