import "package:flutter/material.dart";
import './Questoion.dart';
import './Answers.dart';
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final Function ansQues ;
  final int ind;
  Quiz({@required this.question , @required this.ansQues , @required this.ind});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Questions(question[ind]["QUESTION"]),
          ...(question[ind]["ANSWERS"] as List<Map<String , Object>>).map((ans){ return Answers(ans["Text"],() => ansQues(ans["Score"]));}).toList()
        ],
      );
  }
}