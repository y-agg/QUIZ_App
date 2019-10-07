import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int totalscore ;
  final Function reset;
  Result(this.totalscore , this.reset);

  String get resultphase {
    return "TOTAL CORRECT ANSWERS :  " + totalscore.toString() ;
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Column (
      children : <Widget> 
      [
        Text(resultphase , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold ),),
        FlatButton(child: Text("RESTART QUIZ"),
        textColor: Colors.blue
        , onPressed: reset ,)
        ]
        ),
        );

  }
}