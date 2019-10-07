import "package:flutter/material.dart";
import './Quiz.dart';
import './Result.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  var _ind=0;
  var _totalscore =0 ;
  var _question=[
      { "QUESTION" : "Fav. Color  ? " , "ANSWERS" :[{"Text" :"RED","Score": 1 , } , {"Text" :"Blue","Score": 1 , } , {"Text" :"Green","Score": 1 , } ,{"Text" :"Yellow","Score": 1 , }] },
      { "QUESTION" : "Fav. Brand of laptop ? " ,"ANSWERS" : [{"Text" :"HP","Score": 1 , } , {"Text" :"DELL","Score": 1 , } , {"Text" :"SONY","Score": 1 , } ,{"Text" :"Lenovo","Score": 1 , }] },
      { "QUESTION" : "Fav. MOBIlE  ? " ,"ANSWERS" : [{"Text" :"IPHONE","Score": 1 , } , {"Text" :"MI","Score": 1 , } , {"Text" :"SAMSUNG","Score": 1 , } ,{"Text" :"GOOGLE","Score": 1 , }] },
      { "QUESTION" : "Fav. PlaCE  ? " ,"ANSWERS" : [{"Text" :"DeLHI","Score": 1 , } , {"Text" :"GOA","Score": 1 , } , {"Text" :"MUMBiA","Score": 1 , } ,{"Text" :"UP","Score": 1 , }] },

    ];
  
  void _reset(){
    setState(() {
   _ind=_totalscore=0 ;
    });
  }
  void _ansQues( int score){
     _totalscore += score;
     setState((){
      _ind=_ind+1; 
     });
    }
 
  Widget build(BuildContext context){
    return MaterialApp( home: Scaffold(
      appBar: AppBar(title: Text("Quiz App"),),
      body: _ind < _question.length ? 
       Quiz( question:_question , ansQues:_ansQues , ind:_ind ) : Result(_totalscore, _reset , ),
    ),
    );
  }
}