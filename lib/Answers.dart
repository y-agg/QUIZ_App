import 'package:flutter/material.dart';
class Answers extends StatelessWidget {
  final String text;
  final Function funcname;
  Answers(this.text , this.funcname);
  @override
  Widget build(BuildContext context) {
    return Container( 
      width:double.infinity,
      child :RaisedButton( 
        color: Colors.blue,
        child: Text(text), 
        onPressed:  funcname ,
    ),);
  }
}